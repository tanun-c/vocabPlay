'use strict';

var _ = require('lodash');
var Question = require('./question.model');
var Stat = require('./../stat/stat.model');

// Get list of questions
exports.index = function(req, res) {
  Question.find(function (err, questions) {
    if(err) { return handleError(res, err); }
    return res.status(200).json(questions);
  });
};

// Get a single question
exports.show = function(req, res) {
  Question.findById(req.params.id, function (err, question) {
    if(err) { return handleError(res, err); }
    if(!question) { return res.status(404).send('Not Found'); }
    return res.json(question);
  });
};

// Creates a new question in the DB.
exports.create = function(req, res) {
  Question.create(req.body, function(err, question) {
    if(err) { return handleError(res, err); }
    return res.status(201).json(question);
  });
};

// Updates an existing question in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Question.findById(req.params.id, function (err, question) {
    if (err) { return handleError(res, err); }
    if(!question) { return res.status(404).send('Not Found'); }
    var updated = _.merge(question, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.status(200).json(question);
    });
  });
};

// Deletes a question from the DB.
exports.destroy = function(req, res) {
  Question.findById(req.params.id, function (err, question) {
    if(err) { return handleError(res, err); }
    if(!question) { return res.status(404).send('Not Found'); }
    question.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.status(204).send('No Content');
    });
  });
};

exports.stat = function(req, res) {
  Stat.find({}).sort([['date', 'ascending']]).exec(function (err, questions) {
    if(err) { return handleError(res, err); }
    
    var result = [];

    for (var i = 0; i < questions.length; i++) {
      var question = questions[i];
      
      var existing = _.find(result, {question:question.question});
      
      if (existing) {
        if (question.correct) existing.correct++;
        existing.total++;
        existing.records.push({correct:question.correct});
      } else {
        var newItem = {
          correct: 0, total: 0, records: [], question:question.question
        };

        if (question.correct) newItem.correct++;
        newItem.total++;
        newItem.records.push({correct:(question.correct)});

        result.push(newItem);
      }

    }

    return res.status(200).json(result);
  });
}

function handleError(res, err) {
  return res.status(500).send(err);
}
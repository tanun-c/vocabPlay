'use strict';

var _ = require('lodash');
var Set = require('./set.model');
var Question = require('./../question/question.model');

// Get list of sets
exports.index = function(req, res) {
  Set.find().sort('createdOn').exec(function (err, sets) {
    if(err) { return handleError(res, err); }
    return res.status(200).json(sets);
  });
};

// Get a single set
exports.show = function(req, res) {
  Set.findById(req.params.id).populate('questions.item').exec(function (err, set) {
    if(err) { return handleError(res, err); }
    if(!set) { return res.status(404).send('Not Found'); }

    set.save(function(err, set) {
      return res.json(set);
    });
  });
};

// Creates a new set in the DB.
exports.create = function(req, res) {
  Set.create(req.body, function(err, set) {
    if(err) { return handleError(res, err); }
    return res.status(201).json(set);
  });
};

// Updates an existing set in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Set.findById(req.params.id, function (err, set) {
    if (err) { return handleError(res, err); }
    if(!set) { return res.status(404).send('Not Found'); }
    var updated = _.merge(set, req.body);
    updated.questions = null;
    updated.questions = req.body.questions;
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.status(200).json(set);
    });
  });
};

// Deletes a set from the DB.
exports.destroy = function(req, res) {
  Set.findById(req.params.id, function (err, set) {
    if(err) { return handleError(res, err); }
    if(!set) { return res.status(404).send('Not Found'); }
    set.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.status(204).send('No Content');
    });
  });
};


function handleError(res, err) {
  return res.status(500).send(err);
}
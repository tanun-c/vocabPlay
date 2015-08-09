'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema,
    Stat = require('./../stat/stat.model');

var SetSchema = new Schema({
  name: String,
  info: String,
  questions: [{
    question: String,
    choices: [{
      text: String,
      correct: Boolean
    }],
    explanation: String,
    active: Boolean,
    stat: {
      correct: Number,
      incorrect: Number,
      tries: Number
    }
  }],
  active: Boolean,
  createdOn: { type: Date, default: Date.now}
});

SetSchema.pre('init', function (next, doc) {
  Stat.find({fromSet:doc._id}).exec(function (err, stats) {
    // doc.stats = stats;
    doc.stats = {
      right: 0,
      wrong: 0,
      ratio: 0
    };

    for (var i = 0; i < stats.length; i++) {
      var statItem = stats[i];
      
      if (statItem.correct) {
        doc.stats.right++;
      } else {
        doc.stats.wrong++;
      }
    }

    var total = doc.stats.right + doc.stats.wrong;

    if (total > 0) {
      doc.stats.ratio = doc.stats.right / total;
    } else {
      doc.stats.ratio = 0;
    }

    next();
  });
});

module.exports = mongoose.model('Set', SetSchema);
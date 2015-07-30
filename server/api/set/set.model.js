'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

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
  active: Boolean
});

module.exports = mongoose.model('Set', SetSchema);
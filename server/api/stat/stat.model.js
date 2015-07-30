'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var StatSchema = new Schema({
  question: String,
  correct: Boolean,
  answer: String,
  correctAnswer: String,
  date: {type: Date, default: Date.now}
});

module.exports = mongoose.model('Stat', StatSchema);
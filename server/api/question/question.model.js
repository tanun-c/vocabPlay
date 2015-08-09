'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var QuestionSchema = new Schema({
  question: String,
  questionType: String,
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
});

module.exports = mongoose.model('Question', QuestionSchema);
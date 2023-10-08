const db = require('../config/db');
const bcrypt = require("bcrypt");
const mongoose = require('mongoose');
const { Schema } = mongoose;

const userSchema = new Schema({
 
    email: {
        type: String,
        
        unique: true,
    },
    password: {
        type: String,
    },
    name: {
        type: String,
      },
    birthday: {
        type: Date,
      },
      height: {
        type: Number,
      },
      weight: {
        type: Number,
      },
      gender: {
        type: String,
        enum: ['Male', 'Female'],
      },
    });




const UserModel = db.model('user',userSchema);
module.exports = UserModel;
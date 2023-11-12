

    const mongoose = require('mongoose');

// استخدم سلسلة الاتصال الخاصة بك من MongoDB Atlas
const uri = 'mongodb+srv://ameera:ameera@cluster0.8levxcj.mongodb.net/Gofit?retryWrites=true&w=majority';

mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to MongoDB Atlas');
  })
  .catch(error => {
    console.error('Error connecting to MongoDB Atlas:', error);
  });
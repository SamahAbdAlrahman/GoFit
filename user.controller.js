const UserServices = require('../services/user.service');
exports.register = async (req, res, next) => {
    try {
      const {  email, password,name, birthday, height, weight, gender } = req.body;
    
      await UserServices.registerUser(email, password,name, birthday, height, weight, gender);
      res.status(201).json({ status: true, success: 'User registered successfully' });
    } catch (error) {
      next(error);
    }
  };
  

exports.login = async (req, res, next) => {
    try {

        const { email, password,name, birthday, height, weight, gender } = req.body;

        if (!email || !password) {
            throw new Error('Parameter are not correct');
        }
        let user = await UserServices.checkUser(email);
        if (!user) {
            throw new Error('User does not exist');
        }

        const isPasswordCorrect = await user.comparePassword(password);

        if (isPasswordCorrect === false) {
            throw new Error(`Username or Password does not match`);
        }

        // Creating Token

        let tokenData;
        tokenData = { _id: user._id, email: user.email };
    

        const token = await UserServices.generateAccessToken(tokenData,"secret","1h")

        res.status(200).json({ status: true, success: "sendData", token: token });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}
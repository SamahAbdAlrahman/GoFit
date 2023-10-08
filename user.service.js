const UserModel = require("../models/user.model");
const jwt = require("jsonwebtoken");

class UserServices{
 
    static async registerUser(email, password,name, birthday, height, weight, gender) {
        try {
          const createUser = new UserModel({ email, password,name, birthday, height, weight, gender });
          return await createUser.save();
        } catch (error) {
          throw error;
        }
      }
      

    

    static async generateAccessToken(tokenData,JWTSecret_Key,JWT_EXPIRE){
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }
}

module.exports = UserServices;
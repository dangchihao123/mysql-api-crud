const express = require('express');
const app = express();


// lấy dữ liệu người dùng khi nhập
app.use(express.urlencoded({ extended: true }));
// kq trả về dạng json
app.use(express.json());


// ta require routes user
const user = require("./src/routes/user.route");
// để sử dụng routes ta chuyền biến app vào
user(app);



app.listen(3000);
// để thao tác database ta require đến file kết nối connect nha 
const db = require('../../config/db/connect');
// tạo 1 đối tượng để thao tác với database
const User = function(user) {
        this.ID_USER = user.ID_USER;
        this.ID_BRANCH = user.ID_BRANCH;
        this.NAME_USER = user.NAME_USER;
        this.PASSWORD_USER = user.PASSWORD_USER;
        this.ADDRESS_USER = user.ADDRESS_USER;
        this.TEL_USER = user.TEL_USER;
        this.EMAIL_USER = user.EMAIL_USER;
    }
    // tạo phương thức get_all từ đối tượng User để lấy tất cả user có trong database 
User.get_all = function(result) {
        db.query("SELECT * FROM user", function(err, user) {
            if (err) {
                result(null)
            } else {
                result(user)
            }
        });
    }
    // tạo phương thức getById từ đối tượng User để lấy 1 user theo id có trong database 
User.getById = function(id, result) {
        db.query("SELECT * FROM user WHERE ID_USER = '" + id + "'", id, function(err, user) {
            if (err || user.lenght == 0) {
                result(null)
            } else {
                result(user[0])
            }
        });
    }
    // tạo phương thức create từ đối tượng User để thêm user vào database 
User.create = function(data, result) {
        db.query("INSERT INTO user SET ? ", data, function(err, user) {
            if (err) {
                result(null);
            } else {
                result({ id: user.ID_USER, ...data })
            }
        });
    }
    // tạo phương thức dalete từ đối tượng User để xóa 1 user trong database 
User.delete = function(id, result) {
        db.query("DELETE FROM user WHERE ID_USER = '" + id + "' ", id, function(err, user) {
            if (err) {
                result(null);
            } else {
                result("xóa thành công " + id);
            }
        });
    }
    // tạo phương thức daleteAll từ đối tượng User để xóa tất cả user trong database 
User.deleteAll = function(result) {
        db.query("DELETE FROM user", function(err, user) {
            if (err) {
                result(null)
            } else {
                result(user)
            }
        });
    }
    // tạo phương thức update từ đối tượng User để sửa 1 user theo id trong database 
User.update = function(id, result) {
        db.query("UPDATE user SET ? WHERE ID_USER = ?", [result, id], function(err, user) {
            if (err) {
                result(null)
            } else {
                result(id)
            }
        });
    }
    // tạo phương thức search từ đối tượng User để tìm kiếm user theo name trong database 
User.search = function(name, result) {
    db.query("SELECT * FROM user WHERE NAME_USER LIKE '%" + name + "%'", function(err, user) {
        if (err) {
            result(null)
        } else {
            result(user[0])
        }
    });
}
module.exports = User;
package org.gdou.dao.Impl;

import org.gdou.dao.IUserDao;
import org.gdou.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

// 添加注解，用于创建对象
@Repository
public class IUserDaoImpl implements IUserDao
{
    // 注入JdbcTemplate，用于和数据库交互的，实现对表的CRUD操作
    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 添加用户
    @Override
    public Boolean addUser(User user)
    {
        // 创建sql插入语句
        String sql = "insert into user values(?,?,?,?,?)";


        // 创建一个数组存放可变参数
        Object[] args = {user.getUserId(), user.getUsername(), user.getPassword(), user.getEmail(), user.getRole()};

        // 使用jdbcTemplate.update方法，第一个参数：sql语句，第二个参数：可变参数，设置sql语句值，update接收影响的行数
        int update = jdbcTemplate.update(sql, args);

        System.out.println("影响行数：" + update);

        return true;
    }

    // 删除用户
    @Override
    public Boolean deleteUser(Integer userId)
    {
        // 创建sql删除语句
        String sql = "delete from user where userid = ?";

        int update = jdbcTemplate.update(sql, userId);

        System.out.println("影响行数：" + update);

        return true;
    }

    // 更新用户
    @Override
    public Boolean updateUser(User user)
    {
        // 创建sql更新语句
        String sql = "update user set username = ?, password = ?, email = ? where userId = ?";

        // 创建一个数组存放可变参数
        Object[] args = {user.getUsername(), user.getPassword(), user.getEmail(), user.getUserId()};

        int update = jdbcTemplate.update(sql, args);

        System.out.println("影响行数：" + update);

        return true;
    }

    // 查询一个用户
    @Override
    public User findUserById(Integer userId)
    {
        // 创建sql查询语句
        String sql = "select * from user where userid = ?";

        // 使用jdbcTemplate.queryForObject方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装；第三个参数：sql语句值
        User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), userId);

        return user;
    }

    // 查询所有用户
    @Override
    public List<User> findAllUser()
    {
        // 创建sql查询语句
        String sql = "select * from user";

        // 使用jdbcTemplate.query方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装；第三个参数：sql语句值
        List<User> userList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));

        return userList;
    }


}

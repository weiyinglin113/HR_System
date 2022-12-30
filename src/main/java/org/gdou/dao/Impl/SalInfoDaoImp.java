package org.gdou.dao.Impl;

import org.gdou.dao.SalInfoDao;
import org.gdou.domain.Conditions;
import org.gdou.domain.SalInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;


@Repository
public class SalInfoDaoImp implements SalInfoDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    //添加薪酬信息
    @Override
    public Boolean addSalInfo(SalInfo salInfo) {
//        创建sql插入语句
        String sql = "insert into salinfo values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        // 创建一个数组存放可变参数
        Object[] args = {salInfo.getSalaryId(), salInfo.getSalaryname(), salInfo.getSalaryamount(), salInfo.getEnacters(), salInfo.getRegistrar(), salInfo.getRegister_time(), salInfo.getBasicsalary(), salInfo.getTransportation_sal(), salInfo.getYear_end_sal(), salInfo.getPhone_sal(), salInfo.getOldAge_sal(), salInfo.getUnemployment_sal(), salInfo.getHealth_sal(), salInfo.getHousing_sal(), salInfo.getCheck_salary_time(), salInfo
                .getAdvice(), salInfo.getState()};
        // 使用jdbcTemplate.update方法，第一个参数：sql语句，第二个参数：可变参数，设置sql语句值，update接收影响的行数
        int update = jdbcTemplate.update(sql, args);
        System.out.println("影响行数：" + update);
        return true;
    }

    //查询所有未通过复核的所有薪酬信息
    @Override
    public List<SalInfo> queryCheckingSalInfo() {
        // 创建sql查询语句
        String sql = "select * from salinfo where state is null and check_salary_time is null ";

        // 使用jdbcTemplate.query方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装
        List<SalInfo> salInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<SalInfo>(SalInfo.class));

        return salInfoList;
    }

    @Override
    public SalInfo querySalInfoById(String salaryId) {
        // 创建sql查询语句
        String sql = "select * from salinfo where salaryId = ?";


        // 使用jdbcTemplate.queryForObject方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装；第三个参数：sql语句值
        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<SalInfo>(SalInfo.class), salaryId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }

    @Override
    public Boolean updateSalInfo(SalInfo salInfo) {
        // 创建sql更新语句
        String sql = "update salinfo set check_salary_time=?,advice=?,state='已通过'where salaryId=? ";
        // 创建一个数组存放可变参数
        Object[] args = {salInfo.getCheck_salary_time(), salInfo.getAdvice(), salInfo.getSalaryId()};
        int update = jdbcTemplate.update(sql, args);

        System.out.println("影响行数：" + update);

        return true;
    }


    //查询所有通过复核的薪酬信息
    @Override
    public List<SalInfo> queryAllSalInfo() {
        // 创建sql查询语句
        String sql = "select * from salinfo where state ='已通过'";
        // 使用jdbcTemplate.query方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装
        List<SalInfo> salInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<SalInfo>(SalInfo.class));
        return salInfoList;
    }

    @Override
    public List<SalInfo> querySalByConditions(Conditions conditions) {
        // 创建sql查询语句
        String sql = "select * from salinfo where salaryId like '%{$salaryId}%' and (salaryname like '%{$xxx}%' or enacters like'%{$xxx}%'or register like'%{$xxx}%')register_time between? and ? and state='已通过'";

        Object[] args = {conditions.getSalaryId(), conditions.getXxx(), Timestamp.valueOf(conditions.getStart_time() + " 00:00:00"), Timestamp.valueOf(conditions.getEnd_time() + " 23:59:59")};
        // 使用jdbcTemplate.query方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装
        List<SalInfo> salInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<SalInfo>(SalInfo.class), args);

        return salInfoList;
    }

    @Override
    public Boolean updatesalDetails(SalInfo salInfo) {
        // 创建sql更新语句
        String sql = "update salinfo set salaryname= ?,salaryamount=?,enacters=?,registrar=?,basicsalary=?,Transportation_sal=?,Year_end_sal=?,phone_sal=?,oldAge_sal=?,unemployment_sal=?,health_sal=?,housing_sal=? where salaryId=?";
        // 创建一个数组存放可变参数
        Object[] args = { salInfo.getSalaryname(),salInfo.getSalaryamount(), salInfo.getEnacters(), salInfo.getRegistrar(),salInfo.getBasicsalary(),  salInfo.getTransportation_sal(), salInfo.getYear_end_sal(), salInfo.getPhone_sal(), salInfo.getOldAge_sal(), salInfo.getUnemployment_sal(), salInfo.getHealth_sal(), salInfo.getHousing_sal(),salInfo.getSalaryId()};
        int update = jdbcTemplate.update(sql, args);

        System.out.println("影响行数：" + update);

        return true;
    }


}

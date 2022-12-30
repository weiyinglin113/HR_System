package org.gdou.dao.Impl;

import org.gdou.dao.IUserInfoDao;
import org.gdou.domain.Condition;
import org.gdou.domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public class IUserInfoDaoImpl implements IUserInfoDao
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Boolean addUserInfo(UserInfo userInfo)
    {
        // 创建sql插入语句
        String sql = "insert into userinfo values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        // 创建一个数组存放可变参数
        Object[] args = {userInfo.getFirst_mechaId(), userInfo.getSecond_mechaId(), userInfo.getThird_mechaId(), userInfo.getJob_classId(), userInfo.getJobId(), userInfo.getPtId(), userInfo.getName(), userInfo.getGender(), userInfo.getEmail(), userInfo.getMobilephone(), userInfo.getAddress(), userInfo.getNationId(), userInfo.getIDCard(), userInfo.getAge(), userInfo.getEducationId(), userInfo.getMajorId(), userInfo.getSalaryId(), userInfo.getBank(), userInfo.getBank_card(), userInfo.getRegistrar(), userInfo.getCreate_archive_time(), userInfo.getCheck_archive_time(), userInfo.getResume(), userInfo.getFamily_relation(), userInfo.getRemarks(), userInfo.getArchiveId(), userInfo.getState()};

       // 使用jdbcTemplate.update方法，第一个参数：sql语句，第二个参数： 可变参数，设置sql语句值，update接收影响的行数
        int update = jdbcTemplate.update(sql, args);

        System.out.println("影响行数：" + update);

        return true;
    }

    @Override
    public Boolean deleteUserInfo(String archiveId)
    {
        // 创建sql删除语句
        String sql = "update userinfo set state is not where archiveId = ?";

        int update = jdbcTemplate.update(sql, archiveId);

        System.out.println("影响行数：" + update);

        return true;
    }

    @Override
    public Boolean recoverUserInfo(String archiveId)
    {
        // 创建sql更新语句
        String sql = "update userinfo set state = null where archiveId = ?";

        int update = jdbcTemplate.update(sql, archiveId);

        System.out.println("影响行数：" + update);

        return true;
    }

    @Override
    public Boolean updateUserInfo(UserInfo userInfo)
    {
        // 创建sql更新语句
        String sql = "update userinfo set first_mechaId = ?, second_mechaId = ?, third_mechaId = ?, job_classId = ?, jobId = ?, ptId = ?, name = ?, gender = ?, email = ?, mobilephone = ?, address = ?, nationId = ?, IDCard = ?, age = ?, educationId = ?, majorId = ?, salaryId = ?, bank = ?, bank_card = ?, registrar = ?, create_archive_time = ?, check_archive_time = ?, resume = ?, family_relation = ?, remarks = ?, state='已通过'where archiveId = ?";

        // 创建一个数组存放可变参数
        Object[] args = {userInfo.getFirst_mechaId(), userInfo.getSecond_mechaId(), userInfo.getThird_mechaId(), userInfo.getJob_classId(), userInfo.getJobId(), userInfo.getPtId(), userInfo.getName(), userInfo.getGender(), userInfo.getEmail(), userInfo.getMobilephone(), userInfo.getAddress(), userInfo.getNationId(), userInfo.getIDCard(), userInfo.getAge(), userInfo.getEducationId(), userInfo.getMajorId(), userInfo.getSalaryId(), userInfo.getBank(), userInfo.getBank_card(), userInfo.getRegistrar(), userInfo.getCreate_archive_time(), userInfo.getCheck_archive_time(), userInfo.getResume(), userInfo.getFamily_relation(),userInfo.getRemarks(),  userInfo.getArchiveId()};

        int update = jdbcTemplate.update(sql, args);

        System.out.println("影响行数：" + update);

        return true;
    }

    @Override
    public UserInfo queryUserInfoById(String archiveId)
    {
        // 创建sql查询语句
        String sql = "select * from userinfo where archiveId = ?";

        // 使用jdbcTemplate.queryForObject方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装；第三个参数：sql语句值
        UserInfo userInfo = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), archiveId);

        return userInfo;
    }

    @Override
    public List<UserInfo> queryAllUserInfo()
    {
        // 创建sql查询语句
        String sql = "select * from userinfo where state is null and check_archive_time is not null";

        // 使用jdbcTemplate.query方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装
        List<UserInfo> userInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class));

        return userInfoList;
    }

    // 查询所有未通过复核的所有员工信息
    @Override
    public List<UserInfo> queryCheckingUserInfo()
    {
        // 创建sql查询语句
        String sql = "select * from userinfo where state is null and check_archive_time is null ";

        // 使用jdbcTemplate.query方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装
        List<UserInfo> userInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class));

        return userInfoList;
    }

    @Override
    public List<UserInfo> queryUserByCondition(Condition condition)
    {
        // 创建sql查询语句
        String sql = "select * from userinfo where third_mechaId = ? and jobId = ? and create_archive_time between ? and ? and  state is null and check_archive_time is not null";

        Object[] args = {condition.getThird_mechaId(), condition.getJobId(), Timestamp.valueOf(condition.getStart_time() + " 00:00:00"), Timestamp.valueOf(condition.getEnd_time() + " 23:59:59")};

        // 使用jdbcTemplate.query方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装
        List<UserInfo> userInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), args);

        return userInfoList;
    }

    // 查询所有通过复核的已通过的员工信息
    @Override
    public List<UserInfo> queryDeleteUserInfo()
    {
        // 创建sql查询语句
        String sql = "select * from userinfo where state = '已通过'";

        // 使用jdbcTemplate.query方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装
        List<UserInfo> userInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class));

        return userInfoList;
    }

    @Override
    public List<UserInfo> queryDeleteUserByCondition(Condition condition)
    {
        // 创建sql查询语句
        String sql = "select * from userinfo where third_mechaId = ? and jobId = ? and create_archive_time between ? and ? and state = '已通过' and check_archive_time is not null";

        Object[] args = {condition.getThird_mechaId(), condition.getJobId(), Timestamp.valueOf(condition.getStart_time() + " 00:00:00"), Timestamp.valueOf(condition.getEnd_time() + " 23:59:59")};

        // 使用jdbcTemplate.query方法，第一个参数：sql语句；第二个参数：RowMapper，是个接口，返回不同类型数据时，使用这个接口的实现类完成数据封装
        List<UserInfo> userInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), args);

        return userInfoList;
    }

    @Override
    public String queryFirstMecha(Integer first_mechaId)
    {
        String sql = "select mecha_name from first_mechanisim where mechaId = ?";

        String firstMecha = jdbcTemplate.queryForObject(sql, String.class, first_mechaId);


        return firstMecha;
    }

    @Override
    public String querySecondMecha(Integer second_mechaId)
    {
        String sql = "select mecha_name from second_mechanisim where mechaId = ?";

        String secondMecha = jdbcTemplate.queryForObject(sql, String.class, second_mechaId);

        return secondMecha;
    }

    @Override
    public String queryThirdMecha(Integer third_mechaId)
    {
        String sql = "select mecha_name from third_mechanisim where mechaId = ?";

        String thirdMecha = jdbcTemplate.queryForObject(sql, String.class, third_mechaId);

        return thirdMecha;
    }

    @Override
    public String queryJobClass(Integer job_classId)
    {
        String sql = "select job_type from job_classification where classId = ?";

        String job_type = jdbcTemplate.queryForObject(sql, String.class, job_classId);

        return job_type;
    }

    @Override
    public String queryJob(Integer jobId)
    {
        String sql = "select job_name from job where jobId = ?";

        String job = jdbcTemplate.queryForObject(sql, String.class, jobId);

        return job;
    }

    @Override
    public String queryProTitle(Integer ptId)
    {
        String sql = "select pro_title from professional_title where ptId = ?";

        String pro_title = jdbcTemplate.queryForObject(sql, String.class, ptId);

        return pro_title;
    }

    @Override
    public String queryNation(Integer nationId)
    {
        String sql = "select nation from nation where nationId = ?";

        String nation = jdbcTemplate.queryForObject(sql, String.class, nationId);

        return nation;
    }

    @Override
    public String queryEducation(Integer educationId)
    {
        String sql = "select education from education where educationId = ?";

        String education = jdbcTemplate.queryForObject(sql, String.class, educationId);

        return education;
    }

    @Override
    public String queryMajor(Integer majorId)
    {
        String sql = "select major from major where majorId = ?";

        String major = jdbcTemplate.queryForObject(sql, String.class, majorId);

        return major;
    }

    @Override
    public String querySalary(Integer salaryId)
    {
        String sql = "select salaryname from salary where salaryId = ?";

        String salaryname = jdbcTemplate.queryForObject(sql, String.class, salaryId);

        return salaryname;
    }

    @Override
    public int queryUserInfoCount()
    {
        // 创建sql查询语句
        String sql = "select count(*) from userinfo where state is null";

        // int count = jdbcTemplate.update(sql);

        Integer count = jdbcTemplate.queryForObject(sql, Integer.class);

        return count;
    }
    @Override
    public String querystatusByAchivedId(Integer archivedId)
    {
        // 创建sql查询语句
        String sql = "select state from userinfo where archivedId =?";

        // int count = jdbcTemplate.update(sql);

        String status = jdbcTemplate.queryForObject(sql, String.class,archivedId);

        return status;
    }

}

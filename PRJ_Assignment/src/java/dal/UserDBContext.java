/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.accesscontrol.Feature;
import entity.accesscontrol.Permission;
import entity.accesscontrol.Role;
import entity.accesscontrol.User;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;
/**
 *
 * @author sonnt-local
 */
public class UserDBContext extends DBContext<User> {

    public ArrayList<Role> getRoles(String username) {
        String sql = "SELECT r.RoleID,r.RoleName,f.FeatureID,f.FeatureName,f.url FROM [User] u \n"
                + "	INNER JOIN UserRole ur ON ur.UserName = u.UserName\n"
                + "	INNER JOIN [Role] r ON r.RoleID = ur.RoleID\n"
                + "	INNER JOIN RoleFeature rf ON r.RoleID = rf.RoleID\n"
                + "	INNER JOIN Feature f ON f.FeatureID = rf.FeatureID\n"
                + "WHERE u.UserName = ?\n"
                + "ORDER BY r.RoleID, f.FeatureID ASC";

        PreparedStatement stm = null;
        ArrayList<Role> roles = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            Role c_role = new Role();
            c_role.setId(-1);
            while (rs.next()) {
                int rid = rs.getInt("RoleID");
                if (rid != c_role.getId()) {
                    c_role = new Role();
                    c_role.setId(rid);
                    c_role.setName(rs.getString("RoleName"));
                    roles.add(c_role);
                }

                Feature f = new Feature();
                f.setId(rs.getInt("FeatureID"));
                f.setName(rs.getString("FeatureName"));
                f.setUrl(rs.getString("url"));
                c_role.getFeatures().add(f);
                f.setRoles(roles);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return roles;
    }

    public User get(String username, String password) {
        //encoding username / password
        String sql = "SELECT UserName, displayname FROM [User] \n"
                + "WHERE UserName = ? AND [password] = ?";
        PreparedStatement stm = null;
        User user = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setDisplayname(rs.getString("displayname"));
                user.setUsername(username);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }

    public ArrayList<Permission> geturl(String username) {
        ArrayList<Permission> p = new ArrayList<>();
        PreparedStatement stm = null;
        String sql = "SELECT u.UserName,f.url,f.FeatureName FROM [User] u \n"
                + "	INNER JOIN UserRole ur ON ur.UserName = u.UserName\n"
                + "	INNER JOIN [Role] r ON r.RoleID = ur.RoleID\n"
                + "	INNER JOIN RoleFeature rf ON r.RoleID = rf.RoleID\n"
                + "	INNER JOIN Feature f ON f.FeatureID = rf.FeatureID\n"
                + "WHERE u.UserName = ? and f.show='1'\n"
                +"and url not like'/home'\n"
                + "ORDER BY f.url desc";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String username_str = rs.getString("UserName");
                String url = rs.getString("url");
                String featurename_str = rs.getString("FeatureName");
                p.add(new Permission(username_str, url,featurename_str));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return p;
    }

    @Override
    public void insert(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}

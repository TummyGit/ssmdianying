package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "fangyingting")
public class Fangyingting implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "yingtingbianhao")
    private String yingtingbianhao;
    @Column(name = "yingtingmingcheng")
    private String yingtingmingcheng;
    @Column(name = "jipai")
    private Integer jipai;
    @Column(name = "jilie")
    private Integer jilie;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYingtingbianhao() {
        return yingtingbianhao;
    }
    public void setYingtingbianhao(String yingtingbianhao) {
        this.yingtingbianhao = yingtingbianhao == null ? "" : yingtingbianhao.trim();
    }

    public String getYingtingmingcheng() {
        return yingtingmingcheng;
    }
    public void setYingtingmingcheng(String yingtingmingcheng) {
        this.yingtingmingcheng = yingtingmingcheng == null ? "" : yingtingmingcheng.trim();
    }

    public Integer getJipai() {
        return jipai;
    }
    public void setJipai(Integer jipai) {
        this.jipai = jipai == null ? 0 : jipai;
    }

    public Integer getJilie() {
        return jilie;
    }
    public void setJilie(Integer jilie) {
        this.jilie = jilie == null ? 0 : jilie;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}

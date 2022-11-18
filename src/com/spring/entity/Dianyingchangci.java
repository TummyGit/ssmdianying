package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "dianyingchangci")
public class Dianyingchangci implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "dianyingbianhao")
    private String dianyingbianhao;
    @Column(name = "fenlei")
    private String fenlei;
    @Column(name = "dianyingmingcheng")
    private String dianyingmingcheng;
    @Column(name = "dianyinghaibao")
    private String dianyinghaibao;
    @Column(name = "piaojia")
    private Double piaojia;
    @Column(name = "fangyingting")
    private String fangyingting;
    @Column(name = "kaichangshijian")
    private String kaichangshijian;
    @Column(name = "sanchangshijian")
    private String sanchangshijian;
    @Column(name = "shengyupiaoshu")
    private Integer shengyupiaoshu;
    private Integer dianyingxinxiid;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDianyingbianhao() {
        return dianyingbianhao;
    }
    public void setDianyingbianhao(String dianyingbianhao) {
        this.dianyingbianhao = dianyingbianhao == null ? "" : dianyingbianhao.trim();
    }

    public String getFenlei() {
        return fenlei;
    }
    public void setFenlei(String fenlei) {
        this.fenlei = fenlei == null ? "" : fenlei.trim();
    }

    public String getDianyingmingcheng() {
        return dianyingmingcheng;
    }
    public void setDianyingmingcheng(String dianyingmingcheng) {
        this.dianyingmingcheng = dianyingmingcheng == null ? "" : dianyingmingcheng.trim();
    }

    public String getDianyinghaibao() {
        return dianyinghaibao;
    }
    public void setDianyinghaibao(String dianyinghaibao) {
        this.dianyinghaibao = dianyinghaibao == null ? "" : dianyinghaibao.trim();
    }

    public Double getPiaojia() {
        return piaojia;
    }
    public void setPiaojia(Double piaojia) {
        this.piaojia = piaojia == null ? 0.0f : piaojia;
    }

    public String getFangyingting() {
        return fangyingting;
    }
    public void setFangyingting(String fangyingting) {
        this.fangyingting = fangyingting == null ? "" : fangyingting.trim();
    }

    public String getKaichangshijian() {
        return kaichangshijian;
    }
    public void setKaichangshijian(String kaichangshijian) {
        this.kaichangshijian = kaichangshijian == null ? "" : kaichangshijian.trim();
    }

    public String getSanchangshijian() {
        return sanchangshijian;
    }
    public void setSanchangshijian(String sanchangshijian) {
        this.sanchangshijian = sanchangshijian == null ? "" : sanchangshijian.trim();
    }

    public Integer getShengyupiaoshu() {
        return shengyupiaoshu;
    }
    public void setShengyupiaoshu(Integer shengyupiaoshu) {
        this.shengyupiaoshu = shengyupiaoshu == null ? 0 : shengyupiaoshu;
    }
    public Integer getDianyingxinxiid() {
        return dianyingxinxiid;
    }
    public void setDianyingxinxiid(Integer dianyingxinxiid) {
        this.dianyingxinxiid = dianyingxinxiid == null ? 0 : dianyingxinxiid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}

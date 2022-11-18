package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "dianyingxinxi")
public class Dianyingxinxi implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "dianyingbianhao")
    private String dianyingbianhao;
    @Column(name = "fenlei")
    private String fenlei;
    @Column(name = "dianyinghaibao")
    private String dianyinghaibao;
    @Column(name = "dianyingmingcheng")
    private String dianyingmingcheng;
    @Column(name = "daoyan")
    private String daoyan;
    @Column(name = "zhuyan")
    private String zhuyan;
    @Column(name = "shangyingshijian")
    private String shangyingshijian;
    @Column(name = "shifoureying")
    private String shifoureying;
    @Column(name = "piaojia")
    private Double piaojia;
    @Column(name = "shichang")
    private String shichang;
    @Column(name = "jianjie")
    private String jianjie;

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

    public String getDianyinghaibao() {
        return dianyinghaibao;
    }
    public void setDianyinghaibao(String dianyinghaibao) {
        this.dianyinghaibao = dianyinghaibao == null ? "" : dianyinghaibao.trim();
    }

    public String getDianyingmingcheng() {
        return dianyingmingcheng;
    }
    public void setDianyingmingcheng(String dianyingmingcheng) {
        this.dianyingmingcheng = dianyingmingcheng == null ? "" : dianyingmingcheng.trim();
    }

    public String getDaoyan() {
        return daoyan;
    }
    public void setDaoyan(String daoyan) {
        this.daoyan = daoyan == null ? "" : daoyan.trim();
    }

    public String getZhuyan() {
        return zhuyan;
    }
    public void setZhuyan(String zhuyan) {
        this.zhuyan = zhuyan == null ? "" : zhuyan.trim();
    }

    public String getShangyingshijian() {
        return shangyingshijian;
    }
    public void setShangyingshijian(String shangyingshijian) {
        this.shangyingshijian = shangyingshijian == null ? "" : shangyingshijian.trim();
    }

    public String getShifoureying() {
        return shifoureying;
    }
    public void setShifoureying(String shifoureying) {
        this.shifoureying = shifoureying == null ? "" : shifoureying.trim();
    }

    public Double getPiaojia() {
        return piaojia;
    }
    public void setPiaojia(Double piaojia) {
        this.piaojia = piaojia == null ? 0.0f : piaojia;
    }

    public String getShichang() {
        return shichang;
    }
    public void setShichang(String shichang) {
        this.shichang = shichang == null ? "" : shichang.trim();
    }

    public String getJianjie() {
        return jianjie;
    }
    public void setJianjie(String jianjie) {
        this.jianjie = jianjie == null ? "" : jianjie.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}

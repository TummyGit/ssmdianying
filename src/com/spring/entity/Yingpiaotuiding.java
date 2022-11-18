package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "yingpiaotuiding")
public class Yingpiaotuiding implements Serializable {
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
    @Column(name = "piaojia")
    private Double piaojia;
    @Column(name = "goumaishu")
    private Integer goumaishu;
    @Column(name = "xiaoji")
    private Double xiaoji;
    @Column(name = "goupiaoren")
    private String goupiaoren;
    @Column(name = "kaichangshijian")
    private String kaichangshijian;
    @Column(name = "tuipiaozhangshu")
    private Integer tuipiaozhangshu;
    @Column(name = "tuikuanjine")
    private Double tuikuanjine;
    @Column(name = "tuipiaoyuanyin")
    private String tuipiaoyuanyin;
    private Integer goupiaoid;

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

    public Double getPiaojia() {
        return piaojia;
    }
    public void setPiaojia(Double piaojia) {
        this.piaojia = piaojia == null ? 0.0f : piaojia;
    }

    public Integer getGoumaishu() {
        return goumaishu;
    }
    public void setGoumaishu(Integer goumaishu) {
        this.goumaishu = goumaishu == null ? 0 : goumaishu;
    }

    public Double getXiaoji() {
        return xiaoji;
    }
    public void setXiaoji(Double xiaoji) {
        this.xiaoji = xiaoji == null ? 0.0f : xiaoji;
    }

    public String getGoupiaoren() {
        return goupiaoren;
    }
    public void setGoupiaoren(String goupiaoren) {
        this.goupiaoren = goupiaoren == null ? "" : goupiaoren.trim();
    }

    public String getKaichangshijian() {
        return kaichangshijian;
    }
    public void setKaichangshijian(String kaichangshijian) {
        this.kaichangshijian = kaichangshijian == null ? "" : kaichangshijian.trim();
    }

    public Integer getTuipiaozhangshu() {
        return tuipiaozhangshu;
    }
    public void setTuipiaozhangshu(Integer tuipiaozhangshu) {
        this.tuipiaozhangshu = tuipiaozhangshu == null ? 0 : tuipiaozhangshu;
    }

    public Double getTuikuanjine() {
        return tuikuanjine;
    }
    public void setTuikuanjine(Double tuikuanjine) {
        this.tuikuanjine = tuikuanjine == null ? 0.0f : tuikuanjine;
    }

    public String getTuipiaoyuanyin() {
        return tuipiaoyuanyin;
    }
    public void setTuipiaoyuanyin(String tuipiaoyuanyin) {
        this.tuipiaoyuanyin = tuipiaoyuanyin == null ? "" : tuipiaoyuanyin.trim();
    }
    public Integer getGoupiaoid() {
        return goupiaoid;
    }
    public void setGoupiaoid(Integer goupiaoid) {
        this.goupiaoid = goupiaoid == null ? 0 : goupiaoid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}

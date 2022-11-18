package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "goupiao")
public class Goupiao implements Serializable {
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
    @Column(name = "fangyingting")
    private String fangyingting;
    @Column(name = "kaichangshijian")
    private String kaichangshijian;
    @Column(name = "sanchangshijian")
    private String sanchangshijian;
    @Column(name = "goumaishu")
    private Integer goumaishu;
    @Column(name = "xuanzuo")
    private String xuanzuo;
    @Column(name = "xiaoji")
    private Double xiaoji;
    @Column(name = "goupiaoren")
    private String goupiaoren;
    @Column(name = "dingpiaozhuangtai")
    private String dingpiaozhuangtai;
    private String iszf;
    private Integer dianyingchangciid;

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

    public Integer getGoumaishu() {
        return goumaishu;
    }
    public void setGoumaishu(Integer goumaishu) {
        this.goumaishu = goumaishu == null ? 0 : goumaishu;
    }

    public String getXuanzuo() {
        return xuanzuo;
    }
    public void setXuanzuo(String xuanzuo) {
        this.xuanzuo = xuanzuo == null ? "" : xuanzuo.trim();
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

    public String getDingpiaozhuangtai() {
        return dingpiaozhuangtai;
    }
    public void setDingpiaozhuangtai(String dingpiaozhuangtai) {
        this.dingpiaozhuangtai = dingpiaozhuangtai == null ? "" : dingpiaozhuangtai.trim();
    }
    public String getIszf() {
        return iszf;
    }
    public void setIszf(String iszf) {
        this.iszf = iszf == null ? "" : iszf.trim();
    }
    public Integer getDianyingchangciid() {
        return dianyingchangciid;
    }
    public void setDianyingchangciid(Integer dianyingchangciid) {
        this.dianyingchangciid = dianyingchangciid == null ? 0 : dianyingchangciid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}

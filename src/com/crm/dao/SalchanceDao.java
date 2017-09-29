package com.crm.dao;

import java.util.List;

import com.crm.model.Salchance;
import com.crm.utils.Page;

public interface SalchanceDao {
    //�������ۻ���
    int insertSalchance(Salchance salchance);
    //ģ����ѯ�������ۻ���
    List<Salchance> queryLike(String where);
    //����id��ѯ���ۻ���
	List<Salchance> querySalchanceByid(Salchance salchance);
	//�������ۻ���
	int updateSalchance(Salchance salchance);
	//ɾ�����ۻ���
	int delSalchanceByid(Salchance salchance);
	//ָ�����ۻ���
	int duesalchance(Salchance salchance);
	//ģ����ѯ����δָ�ɵ����ۻ���
	List<Salchance> queryLikeNodue(String where);
	//�����ɹ�
	int updatesalsuccess(Long chcid);
	//��ֹ����
	int updatesaldefeat(Long chcid);
	
	int getSalchanceCount(String where);
	
	int getSalchanceNodueCount(String where);
}
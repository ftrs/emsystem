<?php

/**
 * This is the model class for table "dp5_login_history".
 *
 * The followings are the available columns in table 'dp5_login_history':
 * @property integer $iddp5_login_history
 * @property integer $iddp1_users
 * @property string $login_time
 * @property string $logout_time
 * @property string $client_ip
 *
 * The followings are the available model relations:
 * @property Dp1Users $iddp1Users
 */
class LoginHistory extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp5_login_history';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp1_users', 'numerical', 'integerOnly'=>true),
			array('client_ip', 'length', 'max'=>40),
			array('login_time, logout_time', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp5_login_history, iddp1_users, login_time, logout_time, client_ip', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'iddp1Users' => array(self::BELONGS_TO, 'Dp1Users', 'iddp1_users'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp5_login_history' => 'Iddp5 Login History',
			'iddp1_users' => 'Iddp1 Users',
			'login_time' => 'Login Time',
			'logout_time' => 'Logout Time',
			'client_ip' => 'Client Ip',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('iddp5_login_history',$this->iddp5_login_history);
		$criteria->compare('iddp1_users',$this->iddp1_users);
		$criteria->compare('login_time',$this->login_time,true);
		$criteria->compare('logout_time',$this->logout_time,true);
		$criteria->compare('client_ip',$this->client_ip,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return LoginHistory the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

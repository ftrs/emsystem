<?php

/**
 * This is the model class for table "dp1_users".
 *
 * The followings are the available columns in table 'dp1_users':
 * @property integer $iddp1_users
 * @property integer $iddp3_profile
 * @property string $username
 * @property string $password
 * @property integer $iddp0_roles
 * @property integer $available_reviewer
 * @property integer $reviewer_role
 * @property integer $author_role
 * @property integer $editor_role
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 *
 * The followings are the available model relations:
 * @property Dp0Roles $iddp0Roles
 * @property Dp3Profile $iddp3Profile
 */
class Users extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp1_users';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp3_profile, iddp0_roles, available_reviewer, reviewer_role, author_role, editor_role, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('username', 'length', 'max'=>30),
			array('password', 'length', 'max'=>100),
			array('created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp1_users, iddp3_profile, username, password, iddp0_roles, available_reviewer, reviewer_role, author_role, editor_role, created_date, created_by, modified_date, modified_by', 'safe', 'on'=>'search'),
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
			'iddp0Roles' => array(self::BELONGS_TO, 'Dp0Roles', 'iddp0_roles'),
			'iddp3Profile' => array(self::BELONGS_TO, 'Dp3Profile', 'iddp3_profile'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp1_users' => 'Iddp1 Users',
			'iddp3_profile' => 'Iddp3 Profile',
			'username' => 'Username',
			'password' => 'Password',
			'iddp0_roles' => 'Iddp0 Roles',
			'available_reviewer' => 'Available Reviewer',
			'reviewer_role' => 'Reviewer Role',
			'author_role' => 'Author Role',
			'editor_role' => 'Editor Role',
			'created_date' => 'Created Date',
			'created_by' => 'Created By',
			'modified_date' => 'Modified Date',
			'modified_by' => 'Modified By',
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

		$criteria->compare('iddp1_users',$this->iddp1_users);
		$criteria->compare('iddp3_profile',$this->iddp3_profile);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('iddp0_roles',$this->iddp0_roles);
		$criteria->compare('available_reviewer',$this->available_reviewer);
		$criteria->compare('reviewer_role',$this->reviewer_role);
		$criteria->compare('author_role',$this->author_role);
		$criteria->compare('editor_role',$this->editor_role);
		$criteria->compare('created_date',$this->created_date,true);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('modified_date',$this->modified_date,true);
		$criteria->compare('modified_by',$this->modified_by);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Users the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

<?php

/**
 * This is the model class for table "dp3_profile".
 *
 * The followings are the available columns in table 'dp3_profile':
 * @property integer $iddp3_profile
 * @property string $title
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property string $qualification
 * @property string $country_code
 * @property integer $primary_phone
 * @property integer $secondary_phone
 * @property string $secondary_phone_for
 * @property integer $fax_number
 * @property string $email
 * @property string $preferred_contact_method
 * @property integer $iddp1_subject
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 *
 * The followings are the available model relations:
 * @property Address[] $addresses
 * @property PeopleNotes[] $peopleNotes
 * @property PersonalKeywords[] $personalKeywords
 * @property Dp1Subject $iddp1Subject
 */
class Profile extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp3_profile';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('primary_phone, secondary_phone, fax_number, iddp1_subject, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('title, qualification', 'length', 'max'=>20),
			array('first_name, middle_name, last_name', 'length', 'max'=>30),
			array('country_code', 'length', 'max'=>5),
			array('secondary_phone_for, preferred_contact_method', 'length', 'max'=>11),
			array('email', 'length', 'max'=>100),
			array('created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp3_profile, title, first_name, middle_name, last_name, qualification, country_code, primary_phone, secondary_phone, secondary_phone_for, fax_number, email, preferred_contact_method, iddp1_subject, created_date, created_by, modified_date, modified_by', 'safe', 'on'=>'search'),
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
			'addresses' => array(self::HAS_MANY, 'Address', 'iddp3_profile'),
			'peopleNotes' => array(self::HAS_MANY, 'PeopleNotes', 'iddp3_profile'),
			'personalKeywords' => array(self::HAS_MANY, 'PersonalKeywords', 'iddp3_profile'),
			'iddp1Subject' => array(self::BELONGS_TO, 'Dp1Subject', 'iddp1_subject'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp3_profile' => 'Iddp3 Profile',
			'title' => 'Title',
			'first_name' => 'First Name',
			'middle_name' => 'Middle Name',
			'last_name' => 'Last Name',
			'qualification' => 'Qualification',
			'country_code' => 'Country Code',
			'primary_phone' => 'Primary Phone',
			'secondary_phone' => 'Secondary Phone',
			'secondary_phone_for' => 'Secondary Phone For',
			'fax_number' => 'Fax Number',
			'email' => 'Email',
			'preferred_contact_method' => 'Preferred Contact Method',
			'iddp1_subject' => 'Iddp1 Subject',
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

		$criteria->compare('iddp3_profile',$this->iddp3_profile);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('first_name',$this->first_name,true);
		$criteria->compare('middle_name',$this->middle_name,true);
		$criteria->compare('last_name',$this->last_name,true);
		$criteria->compare('qualification',$this->qualification,true);
		$criteria->compare('country_code',$this->country_code,true);
		$criteria->compare('primary_phone',$this->primary_phone);
		$criteria->compare('secondary_phone',$this->secondary_phone);
		$criteria->compare('secondary_phone_for',$this->secondary_phone_for,true);
		$criteria->compare('fax_number',$this->fax_number);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('preferred_contact_method',$this->preferred_contact_method,true);
		$criteria->compare('iddp1_subject',$this->iddp1_subject);
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
	 * @return Profile the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

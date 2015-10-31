<?php

/**
 * This is the model class for table "dp3_address".
 *
 * The followings are the available columns in table 'dp3_address':
 * @property integer $iddp3_address
 * @property integer $iddp3_profile
 * @property string $position
 * @property string $institution
 * @property string $department
 * @property string $street_address
 * @property string $city
 * @property string $state
 * @property integer $zip_code
 * @property integer $iddp0_country
 * @property string $address_for
 * @property integer $available_as_reviewer
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 *
 * The followings are the available model relations:
 * @property Dp0Country $iddp0Country
 * @property Profile $iddp3Profile
 */
class Address extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp3_address';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp3_profile, zip_code, iddp0_country, available_as_reviewer, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('position, city, state', 'length', 'max'=>50),
			array('institution, department', 'length', 'max'=>250),
			array('address_for', 'length', 'max'=>5),
			array('street_address, created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp3_address, iddp3_profile, position, institution, department, street_address, city, state, zip_code, iddp0_country, address_for, available_as_reviewer, created_date, created_by, modified_date, modified_by', 'safe', 'on'=>'search'),
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
			'iddp0Country' => array(self::BELONGS_TO, 'Dp0Country', 'iddp0_country'),
			'iddp3Profile' => array(self::BELONGS_TO, 'Profile', 'iddp3_profile'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp3_address' => 'Iddp3 Address',
			'iddp3_profile' => 'Iddp3 Profile',
			'position' => 'Position',
			'institution' => 'Institution',
			'department' => 'Department',
			'street_address' => 'Street Address',
			'city' => 'City',
			'state' => 'State',
			'zip_code' => 'Zip Code',
			'iddp0_country' => 'Iddp0 Country',
			'address_for' => 'Address For',
			'available_as_reviewer' => 'Available As Reviewer',
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

		$criteria->compare('iddp3_address',$this->iddp3_address);
		$criteria->compare('iddp3_profile',$this->iddp3_profile);
		$criteria->compare('position',$this->position,true);
		$criteria->compare('institution',$this->institution,true);
		$criteria->compare('department',$this->department,true);
		$criteria->compare('street_address',$this->street_address,true);
		$criteria->compare('city',$this->city,true);
		$criteria->compare('state',$this->state,true);
		$criteria->compare('zip_code',$this->zip_code);
		$criteria->compare('iddp0_country',$this->iddp0_country);
		$criteria->compare('address_for',$this->address_for,true);
		$criteria->compare('available_as_reviewer',$this->available_as_reviewer);
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
	 * @return Address the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

<?php

/**
 * This is the model class for table "dp4_expertise".
 *
 * The followings are the available columns in table 'dp4_expertise':
 * @property integer $iddp4_expertise
 * @property integer $iddp3_profile
 * @property integer $iddp1_classification
 * @property integer $iddp2_subclassification
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 *
 * The followings are the available model relations:
 * @property Dp1Classification $iddp1Classification
 * @property Dp2Subclassification $iddp2Subclassification
 * @property Dp3Profile $iddp3Profile
 */
class Expertise extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp4_expertise';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp3_profile, iddp1_classification, iddp2_subclassification, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp4_expertise, iddp3_profile, iddp1_classification, iddp2_subclassification, created_date, created_by, modified_date, modified_by', 'safe', 'on'=>'search'),
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
			'iddp1Classification' => array(self::BELONGS_TO, 'Dp1Classification', 'iddp1_classification'),
			'iddp2Subclassification' => array(self::BELONGS_TO, 'Dp2Subclassification', 'iddp2_subclassification'),
			'iddp3Profile' => array(self::BELONGS_TO, 'Dp3Profile', 'iddp3_profile'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp4_expertise' => 'Iddp4 Expertise',
			'iddp3_profile' => 'Iddp3 Profile',
			'iddp1_classification' => 'Iddp1 Classification',
			'iddp2_subclassification' => 'Iddp2 Subclassification',
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

		$criteria->compare('iddp4_expertise',$this->iddp4_expertise);
		$criteria->compare('iddp3_profile',$this->iddp3_profile);
		$criteria->compare('iddp1_classification',$this->iddp1_classification);
		$criteria->compare('iddp2_subclassification',$this->iddp2_subclassification);
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
	 * @return Expertise the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

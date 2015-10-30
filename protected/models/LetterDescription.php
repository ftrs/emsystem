<?php

/**
 * This is the model class for table "dp0_letter_description".
 *
 * The followings are the available columns in table 'dp0_letter_description':
 * @property integer $iddp0_letter_description
 * @property string $description
 * @property integer $iddp0_letter_types
 *
 * The followings are the available model relations:
 * @property LetterTypes $iddp0LetterTypes
 */
class LetterDescription extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp0_letter_description';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp0_letter_description', 'required'),
			array('iddp0_letter_description, iddp0_letter_types', 'numerical', 'integerOnly'=>true),
			array('description', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp0_letter_description, description, iddp0_letter_types', 'safe', 'on'=>'search'),
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
			'iddp0LetterTypes' => array(self::BELONGS_TO, 'LetterTypes', 'iddp0_letter_types'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp0_letter_description' => 'Iddp0 Letter Description',
			'description' => 'Description',
			'iddp0_letter_types' => 'Iddp0 Letter Types',
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

		$criteria->compare('iddp0_letter_description',$this->iddp0_letter_description);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('iddp0_letter_types',$this->iddp0_letter_types);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return LetterDescription the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

<?php

/**
 * This is the model class for table "dp5_letter_description".
 *
 * The followings are the available columns in table 'dp5_letter_description':
 * @property integer $iddp0_letter_description
 * @property string $description
 * @property integer $iddp1_subject
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 * @property integer $article_decision
 * @property integer $iddp0_letter_types
 *
 * The followings are the available model relations:
 * @property Dp0LetterTypes $iddp0LetterTypes
 * @property Dp1Subject $iddp1Subject
 */
class LetterDescription extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp5_letter_description';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp1_subject, created_by, modified_by, article_decision, iddp0_letter_types', 'numerical', 'integerOnly'=>true),
			array('description, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp0_letter_description, description, iddp1_subject, created_by, modified_date, modified_by, article_decision, iddp0_letter_types', 'safe', 'on'=>'search'),
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
			'iddp0LetterTypes' => array(self::BELONGS_TO, 'Dp0LetterTypes', 'iddp0_letter_types'),
			'iddp1Subject' => array(self::BELONGS_TO, 'Dp1Subject', 'iddp1_subject'),
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
			'iddp1_subject' => 'Iddp1 Subject',
			'created_by' => 'Created By',
			'modified_date' => 'Modified Date',
			'modified_by' => 'Modified By',
			'article_decision' => 'Article Decision',
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
		$criteria->compare('iddp1_subject',$this->iddp1_subject);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('modified_date',$this->modified_date,true);
		$criteria->compare('modified_by',$this->modified_by);
		$criteria->compare('article_decision',$this->article_decision);
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

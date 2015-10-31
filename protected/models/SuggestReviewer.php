<?php

/**
 * This is the model class for table "dp3_suggest_reviewer".
 *
 * The followings are the available columns in table 'dp3_suggest_reviewer':
 * @property integer $iddp3_suggest_reviewer
 * @property integer $iddp3_article
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property string $academic_degree
 * @property string $position
 * @property string $institution
 * @property string $department
 * @property string $email
 * @property string $reason
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 *
 * The followings are the available model relations:
 * @property Article $iddp3Article
 */
class SuggestReviewer extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp3_suggest_reviewer';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp3_article, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('first_name, middle_name, last_name', 'length', 'max'=>30),
			array('academic_degree, position, email', 'length', 'max'=>100),
			array('institution, department', 'length', 'max'=>250),
			array('reason, created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp3_suggest_reviewer, iddp3_article, first_name, middle_name, last_name, academic_degree, position, institution, department, email, reason, created_date, created_by, modified_date, modified_by', 'safe', 'on'=>'search'),
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
			'iddp3Article' => array(self::BELONGS_TO, 'Article', 'iddp3_article'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp3_suggest_reviewer' => 'Iddp3 Suggest Reviewer',
			'iddp3_article' => 'Iddp3 Article',
			'first_name' => 'First Name',
			'middle_name' => 'Middle Name',
			'last_name' => 'Last Name',
			'academic_degree' => 'Academic Degree',
			'position' => 'Position',
			'institution' => 'Institution',
			'department' => 'Department',
			'email' => 'Email',
			'reason' => 'Reason',
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

		$criteria->compare('iddp3_suggest_reviewer',$this->iddp3_suggest_reviewer);
		$criteria->compare('iddp3_article',$this->iddp3_article);
		$criteria->compare('first_name',$this->first_name,true);
		$criteria->compare('middle_name',$this->middle_name,true);
		$criteria->compare('last_name',$this->last_name,true);
		$criteria->compare('academic_degree',$this->academic_degree,true);
		$criteria->compare('position',$this->position,true);
		$criteria->compare('institution',$this->institution,true);
		$criteria->compare('department',$this->department,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('reason',$this->reason,true);
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
	 * @return SuggestReviewer the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

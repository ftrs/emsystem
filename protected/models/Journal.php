<?php

/**
 * This is the model class for table "dp1_journal".
 *
 * The followings are the available columns in table 'dp1_journal':
 * @property integer $iddp1_journal
 * @property string $name
 * @property string $short_name
 * @property string $journal_email
 * @property string $journal_url
 * @property integer $iddp1_subject
 * @property integer $iddp1_organization
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 *
 * The followings are the available model relations:
 * @property Organization $iddp1Organization
 * @property Subject $iddp1Subject
 */
class Journal extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp1_journal';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp1_subject, iddp1_organization, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>255),
			array('short_name', 'length', 'max'=>10),
			array('journal_email', 'length', 'max'=>100),
			array('journal_url', 'length', 'max'=>150),
			array('created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp1_journal, name, short_name, journal_email, journal_url, iddp1_subject, iddp1_organization, created_date, created_by, modified_date, modified_by', 'safe', 'on'=>'search'),
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
			'iddp1Organization' => array(self::BELONGS_TO, 'Organization', 'iddp1_organization'),
			'iddp1Subject' => array(self::BELONGS_TO, 'Subject', 'iddp1_subject'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp1_journal' => 'Iddp1 Journal',
			'name' => 'Name',
			'short_name' => 'Short Name',
			'journal_email' => 'Journal Email',
			'journal_url' => 'Journal Url',
			'iddp1_subject' => 'Iddp1 Subject',
			'iddp1_organization' => 'Iddp1 Organization',
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

		$criteria->compare('iddp1_journal',$this->iddp1_journal);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('short_name',$this->short_name,true);
		$criteria->compare('journal_email',$this->journal_email,true);
		$criteria->compare('journal_url',$this->journal_url,true);
		$criteria->compare('iddp1_subject',$this->iddp1_subject);
		$criteria->compare('iddp1_organization',$this->iddp1_organization);
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
	 * @return Journal the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

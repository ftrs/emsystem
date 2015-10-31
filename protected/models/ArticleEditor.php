<?php

/**
 * This is the model class for table "dp4_article_editor".
 *
 * The followings are the available columns in table 'dp4_article_editor':
 * @property integer $iddp4_article_editor
 * @property integer $iddp3_article
 * @property integer $iddp3_profile
 * @property integer $assignment_accept_status
 * @property integer $active_status
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 * @property integer $iddp0_editor_decision
 *
 * The followings are the available model relations:
 * @property Dp0EditorDecision $iddp0EditorDecision
 * @property Dp3Article $iddp3Article
 * @property AssignReviewer[] $assignReviewers
 */
class ArticleEditor extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp4_article_editor';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp3_article, iddp3_profile, assignment_accept_status, active_status, created_by, modified_by, iddp0_editor_decision', 'numerical', 'integerOnly'=>true),
			array('created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp4_article_editor, iddp3_article, iddp3_profile, assignment_accept_status, active_status, created_date, created_by, modified_date, modified_by, iddp0_editor_decision', 'safe', 'on'=>'search'),
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
			'iddp0EditorDecision' => array(self::BELONGS_TO, 'Dp0EditorDecision', 'iddp0_editor_decision'),
			'iddp3Article' => array(self::BELONGS_TO, 'Dp3Article', 'iddp3_article'),
			'assignReviewers' => array(self::HAS_MANY, 'AssignReviewer', 'iddp4_article_editor'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp4_article_editor' => 'Iddp4 Article Editor',
			'iddp3_article' => 'Iddp3 Article',
			'iddp3_profile' => 'Iddp3 Profile',
			'assignment_accept_status' => 'Assignment Accept Status',
			'active_status' => 'Active Status',
			'created_date' => 'Created Date',
			'created_by' => 'Created By',
			'modified_date' => 'Modified Date',
			'modified_by' => 'Modified By',
			'iddp0_editor_decision' => 'Iddp0 Editor Decision',
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

		$criteria->compare('iddp4_article_editor',$this->iddp4_article_editor);
		$criteria->compare('iddp3_article',$this->iddp3_article);
		$criteria->compare('iddp3_profile',$this->iddp3_profile);
		$criteria->compare('assignment_accept_status',$this->assignment_accept_status);
		$criteria->compare('active_status',$this->active_status);
		$criteria->compare('created_date',$this->created_date,true);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('modified_date',$this->modified_date,true);
		$criteria->compare('modified_by',$this->modified_by);
		$criteria->compare('iddp0_editor_decision',$this->iddp0_editor_decision);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ArticleEditor the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

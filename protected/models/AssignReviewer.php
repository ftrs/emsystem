<?php

/**
 * This is the model class for table "dp4_assign_reviewer".
 *
 * The followings are the available columns in table 'dp4_assign_reviewer':
 * @property integer $iddp4_assign_reviewer
 * @property integer $iddp3_article
 * @property integer $iddp4_article_editor
 * @property integer $assignment_accept_status
 * @property integer $active_status
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 * @property integer $article_decision
 *
 * The followings are the available model relations:
 * @property Dp3Article $iddp3Article
 * @property ArticleEditor $iddp4ArticleEditor
 */
class AssignReviewer extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp4_assign_reviewer';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp3_article, iddp4_article_editor, assignment_accept_status, active_status, created_by, modified_by, article_decision', 'numerical', 'integerOnly'=>true),
			array('created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp4_assign_reviewer, iddp3_article, iddp4_article_editor, assignment_accept_status, active_status, created_date, created_by, modified_date, modified_by, article_decision', 'safe', 'on'=>'search'),
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
			'iddp3Article' => array(self::BELONGS_TO, 'Dp3Article', 'iddp3_article'),
			'iddp4ArticleEditor' => array(self::BELONGS_TO, 'ArticleEditor', 'iddp4_article_editor'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp4_assign_reviewer' => 'Iddp4 Assign Reviewer',
			'iddp3_article' => 'Iddp3 Article',
			'iddp4_article_editor' => 'Iddp4 Article Editor',
			'assignment_accept_status' => 'Assignment Accept Status',
			'active_status' => 'Active Status',
			'created_date' => 'Created Date',
			'created_by' => 'Created By',
			'modified_date' => 'Modified Date',
			'modified_by' => 'Modified By',
			'article_decision' => 'Article Decision',
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

		$criteria->compare('iddp4_assign_reviewer',$this->iddp4_assign_reviewer);
		$criteria->compare('iddp3_article',$this->iddp3_article);
		$criteria->compare('iddp4_article_editor',$this->iddp4_article_editor);
		$criteria->compare('assignment_accept_status',$this->assignment_accept_status);
		$criteria->compare('active_status',$this->active_status);
		$criteria->compare('created_date',$this->created_date,true);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('modified_date',$this->modified_date,true);
		$criteria->compare('modified_by',$this->modified_by);
		$criteria->compare('article_decision',$this->article_decision);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return AssignReviewer the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

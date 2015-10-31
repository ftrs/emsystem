<?php

/**
 * This is the model class for table "dp3_article".
 *
 * The followings are the available columns in table 'dp3_article':
 * @property integer $iddp3_article
 * @property integer $iddp0_article_type
 * @property string $name
 * @property string $short_name
 * @property integer $iddp1_journal
 * @property string $abstract
 * @property string $keywords
 * @property string $manuscript_no
 * @property integer $approved_status
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 * @property string $article_status
 * @property string $revised_status
 * @property string $revised_date
 *
 * The followings are the available model relations:
 * @property Dp0ArticleType $iddp0ArticleType
 * @property Dp1Journal $iddp1Journal
 * @property ArticleAuthor[] $articleAuthors
 * @property ArticleComments[] $articleComments
 * @property ArticlePdf[] $articlePdfs
 * @property ArticleUploades[] $articleUploades
 * @property SuggestReviewer[] $suggestReviewers
 */
class Article extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp3_article';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp0_article_type, iddp1_journal, approved_status, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>255),
			array('short_name', 'length', 'max'=>200),
			array('manuscript_no', 'length', 'max'=>30),
			array('article_status', 'length', 'max'=>100),
			array('revised_status', 'length', 'max'=>20),
			array('abstract, keywords, created_date, modified_date, revised_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp3_article, iddp0_article_type, name, short_name, iddp1_journal, abstract, keywords, manuscript_no, approved_status, created_date, created_by, modified_date, modified_by, article_status, revised_status, revised_date', 'safe', 'on'=>'search'),
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
			'iddp0ArticleType' => array(self::BELONGS_TO, 'Dp0ArticleType', 'iddp0_article_type'),
			'iddp1Journal' => array(self::BELONGS_TO, 'Dp1Journal', 'iddp1_journal'),
			'articleAuthors' => array(self::HAS_MANY, 'ArticleAuthor', 'iddp3_article'),
			'articleComments' => array(self::HAS_MANY, 'ArticleComments', 'iddp3_article'),
			'articlePdfs' => array(self::HAS_MANY, 'ArticlePdf', 'iddp3_article'),
			'articleUploades' => array(self::HAS_MANY, 'ArticleUploades', 'iddp3_article'),
			'suggestReviewers' => array(self::HAS_MANY, 'SuggestReviewer', 'iddp3_article'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp3_article' => 'Iddp3 Article',
			'iddp0_article_type' => 'Iddp0 Article Type',
			'name' => 'Name',
			'short_name' => 'Short Name',
			'iddp1_journal' => 'Iddp1 Journal',
			'abstract' => 'Abstract',
			'keywords' => 'Keywords',
			'manuscript_no' => 'Manuscript No',
			'approved_status' => 'Approved Status',
			'created_date' => 'Created Date',
			'created_by' => 'Created By',
			'modified_date' => 'Modified Date',
			'modified_by' => 'Modified By',
			'article_status' => 'Article Status',
			'revised_status' => 'Revised Status',
			'revised_date' => 'Revised Date',
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

		$criteria->compare('iddp3_article',$this->iddp3_article);
		$criteria->compare('iddp0_article_type',$this->iddp0_article_type);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('short_name',$this->short_name,true);
		$criteria->compare('iddp1_journal',$this->iddp1_journal);
		$criteria->compare('abstract',$this->abstract,true);
		$criteria->compare('keywords',$this->keywords,true);
		$criteria->compare('manuscript_no',$this->manuscript_no,true);
		$criteria->compare('approved_status',$this->approved_status);
		$criteria->compare('created_date',$this->created_date,true);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('modified_date',$this->modified_date,true);
		$criteria->compare('modified_by',$this->modified_by);
		$criteria->compare('article_status',$this->article_status,true);
		$criteria->compare('revised_status',$this->revised_status,true);
		$criteria->compare('revised_date',$this->revised_date,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Article the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

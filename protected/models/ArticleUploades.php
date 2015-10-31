<?php

/**
 * This is the model class for table "dp3_article_uploades".
 *
 * The followings are the available columns in table 'dp3_article_uploades':
 * @property integer $iddp3_article_uploades
 * @property integer $iddp3_article
 * @property integer $file_order
 * @property integer $iddp0_file_type
 * @property string $descritpion
 * @property string $file_name
 * @property string $file_size
 * @property string $created_date
 * @property integer $created_by
 * @property string $modified_date
 * @property integer $modified_by
 *
 * The followings are the available model relations:
 * @property Dp0FileType $iddp0FileType
 * @property Article $iddp3Article
 */
class ArticleUploades extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dp3_article_uploades';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iddp3_article, file_order, iddp0_file_type, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('descritpion', 'length', 'max'=>200),
			array('file_name', 'length', 'max'=>100),
			array('file_size', 'length', 'max'=>10),
			array('created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('iddp3_article_uploades, iddp3_article, file_order, iddp0_file_type, descritpion, file_name, file_size, created_date, created_by, modified_date, modified_by', 'safe', 'on'=>'search'),
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
			'iddp0FileType' => array(self::BELONGS_TO, 'Dp0FileType', 'iddp0_file_type'),
			'iddp3Article' => array(self::BELONGS_TO, 'Article', 'iddp3_article'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'iddp3_article_uploades' => 'Iddp3 Article Uploades',
			'iddp3_article' => 'Iddp3 Article',
			'file_order' => 'File Order',
			'iddp0_file_type' => 'Iddp0 File Type',
			'descritpion' => 'Descritpion',
			'file_name' => 'File Name',
			'file_size' => 'File Size',
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

		$criteria->compare('iddp3_article_uploades',$this->iddp3_article_uploades);
		$criteria->compare('iddp3_article',$this->iddp3_article);
		$criteria->compare('file_order',$this->file_order);
		$criteria->compare('iddp0_file_type',$this->iddp0_file_type);
		$criteria->compare('descritpion',$this->descritpion,true);
		$criteria->compare('file_name',$this->file_name,true);
		$criteria->compare('file_size',$this->file_size,true);
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
	 * @return ArticleUploades the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

<?php
$module_name = 'VWNA_VILLAWLNEWACTIVE';
$listViewDefs [$module_name] = 
array (
  'SNO_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_SNO',
    'width' => '10%',
  ),
  'NAME' => 
  array (
    'width' => '20%',
    'label' => 'LBL_NAME',
    'link' => true,
    'orderBy' => 'last_name',
    'default' => true,
    'related_fields' => 
    array (
      0 => 'first_name',
      1 => 'last_name',
      2 => 'salutation',
    ),
  ),
  'DEPARTMENT' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_DEPARTMENT',
    'width' => '10%',
    'default' => true,
  ),
  'MSD_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_MSD',
    'width' => '10%',
  ),
  'MILMSD_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_MILMSD',
    'width' => '10%',
  ),
  'GRADE_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_GRADE',
    'width' => '10%',
  ),
  'PACCOM_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_PACCOM',
    'width' => '10%',
  ),
  'APPDATE_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_APPDATE',
    'width' => '10%',
  ),
  'NOOFDEP_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_NOOFDEP',
    'width' => '10%',
  ),
  'REMARKS_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_REMARKS',
    'width' => '10%',
  ),
  'DO_NOT_CALL' => 
  array (
    'width' => '10%',
    'label' => 'LBL_DO_NOT_CALL',
    'default' => false,
  ),
  'TITLE' => 
  array (
    'width' => '15%',
    'label' => 'LBL_TITLE',
    'default' => false,
  ),
  'PHONE_HOME' => 
  array (
    'width' => '10%',
    'label' => 'LBL_HOME_PHONE',
    'default' => false,
  ),
  'PHONE_WORK' => 
  array (
    'width' => '15%',
    'label' => 'LBL_OFFICE_PHONE',
    'default' => false,
  ),
  'PHONE_MOBILE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_MOBILE_PHONE',
    'default' => false,
  ),
  'EMAIL1' => 
  array (
    'width' => '15%',
    'label' => 'LBL_EMAIL_ADDRESS',
    'sortable' => false,
    'link' => true,
    'customCode' => '{$EMAIL1_LINK}{$EMAIL1}</a>',
    'default' => false,
  ),
  'PHONE_OTHER' => 
  array (
    'width' => '10%',
    'label' => 'LBL_WORK_PHONE',
    'default' => false,
  ),
  'PHONE_FAX' => 
  array (
    'width' => '10%',
    'label' => 'LBL_FAX_PHONE',
    'default' => false,
  ),
  'ADDRESS_STREET' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_STREET',
    'default' => false,
  ),
  'ADDRESS_CITY' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_CITY',
    'default' => false,
  ),
  'ADDRESS_STATE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_STATE',
    'default' => false,
  ),
  'ADDRESS_POSTALCODE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_POSTALCODE',
    'default' => false,
  ),
  'DATE_ENTERED' => 
  array (
    'width' => '10%',
    'label' => 'LBL_DATE_ENTERED',
    'default' => false,
  ),
  'CREATED_BY_NAME' => 
  array (
    'width' => '10%',
    'label' => 'LBL_CREATED',
    'default' => false,
  ),
);
?>

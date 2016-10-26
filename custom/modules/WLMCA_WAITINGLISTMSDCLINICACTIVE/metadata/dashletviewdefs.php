<?php
$dashletData['WLMCA_WAITINGLISTMSDCLINICACTIVEDashlet']['searchFields'] = array (
  'date_entered' => 
  array (
    'default' => '',
  ),
  'date_modified' => 
  array (
    'default' => '',
  ),
  'assigned_user_id' => 
  array (
    'type' => 'assigned_user_name',
    'default' => 'ahmed Administrator',
  ),
);
$dashletData['WLMCA_WAITINGLISTMSDCLINICACTIVEDashlet']['columns'] = array (
  'sno_c' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_SNO',
    'width' => '10%',
  ),
  'last_name' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_LAST_NAME',
    'width' => '10%',
    'default' => true,
  ),
  'department' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_DEPARTMENT',
    'width' => '10%',
    'default' => true,
  ),
  'msd_c' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_MSD',
    'width' => '10%',
  ),
  'milmsd_c' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_MILMSD',
    'width' => '10%',
  ),
);

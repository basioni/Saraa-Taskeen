<?php
$module_name = 'VWNA_VILLAWLNEWACTIVE';
$viewdefs [$module_name] = 
array (
  'QuickCreate' => 
  array (
    'templateMeta' => 
    array (
      'maxColumns' => '2',
      'widths' => 
      array (
        0 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
        1 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
      ),
      'useTabs' => false,
      'tabDefs' => 
      array (
        'LBL_CONTACT_INFORMATION' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
    ),
    'panels' => 
    array (
      'lbl_contact_information' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'sno_c',
            'label' => 'LBL_SNO',
          ),
          1 => 
          array (
            'name' => 'grade_c',
            'label' => 'LBL_GRADE',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'last_name',
            'displayParams' => 
            array (
              'required' => true,
            ),
          ),
          1 => 
          array (
            'name' => 'paccom_c',
            'label' => 'LBL_PACCOM',
          ),
        ),
        2 => 
        array (
          0 => 'department',
          1 => 
          array (
            'name' => 'appdate_c',
            'label' => 'LBL_APPDATE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'msd_c',
            'label' => 'LBL_MSD',
          ),
          1 => 
          array (
            'name' => 'noofdep_c',
            'label' => 'LBL_NOOFDEP',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'milmsd_c',
            'label' => 'LBL_MILMSD',
          ),
          1 => 
          array (
            'name' => 'remarks_c',
            'label' => 'LBL_REMARKS',
          ),
        ),
      ),
    ),
  ),
);
?>

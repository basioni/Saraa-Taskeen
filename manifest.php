<?PHP 
$manifest = array( 
	'name' => 'ar_eg (enterprise)',
	'type' => 'langpack',
	'is_uninstallable' => 'Yes',
	'acceptable_sugar_flavors' => array (),
	'author' => 'IT Synergy',
	'acceptable_sugar_versions' => array (),
);

$installdefs = array(
	'id'=> 'ar_eg',
	'image_dir'=>'<basepath>/images',
	'copy' => array(
	array('from'=> '<basepath>/include','to'=> 'include',),
	array('from'=> '<basepath>/modules','to'=> 'modules'))
);
?>

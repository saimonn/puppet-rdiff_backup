define rdiff_backup::pool (
  $max_process,
  $destination_dir,
  $ensure=present,
) {

  $mycontent = $ensure ? {
    'present' => template('rdiff_backup/pool.erb'),
    default   => ''
  }
  concat::fragment {$name:
    target  => '/etc/multiprocessing-rdiff-backup.conf',
    content => $mycontent,
  }
}

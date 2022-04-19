<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

// This enables debugging.
define( 'WP_DEBUG', true );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '*/O]}{X2PC_|P+jC,geN^cL|m]KL-&_`;8Xo][>1g5n;{Z5>R*PQ-6cT|)#%YeIq');
define('SECURE_AUTH_KEY',  '_]9uW9r]7uz/-P+ZYF[b`p^kwjGZc)j+4;,p:zI?+Og#zg%i:x6 .6P*!$8Kjae`');
define('LOGGED_IN_KEY',    'O@uPpo0j4^^Z2WY!iYi2R]>6TSd4pFRv9)PU<Yd_xNa-N p!^Pwf7W>9jMHB|G;A');
define('NONCE_KEY',        'EYh`GsYEwuTA^{EQ|+}Lslr;O51#IXn5eM_P|)9kg<@WVefgOH_;gNuiz|!oFzlP');
define('AUTH_SALT',        'qlpvzl(hFM)+Aj~=}=aT|_~!|ZgM,? SY@=M-5hUm!~5bqdJJQ=5GaYt.wkcj}DA');
define('SECURE_AUTH_SALT', 'bx.|4+:-ZY9~[+RrHSpGs9clG2ty+Sx|F#RFHWqxq=GC(hMO,C:?c:38UeNvV1C0');
define('LOGGED_IN_SALT',   'igB.K&v{=UgN]|YbgW7hkb&L9*/S3lf7l?)UvcG+x-#z;aAkIpw2)p.}Q_sgmX$~');
define('NONCE_SALT',       ']Z^~z]h<Om@];$.)svF4^fge53Bw?-O.j~&Fj66U80z:4Z/sA&T8lzkSjYL^gAqO');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/var/www/wordpress' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

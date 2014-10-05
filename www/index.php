<?php

//@todo: pegar todos os links das páginas
//@todo: validar as urls que ja foram visitadas. Verificar se tem novos programas.
//@todo: tendo novos programas roda o download dos mesmo arquivos
//@todo: sentar target para os arquivos

error_reporting(E_ALL);

require_once('download.php');

$t = microtime(true);

$urls = array(
  'http://jazzmasters.com.br/programas/jazzmasters-699-20-09-2014/',
  'http://jazzmasters.com.br/programas/jazzmasters-698-13-09-2014/',
  'http://jazzmasters.com.br/programas/jazzmasters-697-06-07-2014/',
);

$objects = array();

// if($download->start()){
  printf('Thread running... %.6f seg',microtime(true)-$t);
  echo "\n";

  for ($i=0; $i < count($urls); $i++) {
    // seta as urls
    $objects[$i] = new Download($urls[$i]);
  }

  for ($i=0; $i < count($objects); $i++) {
    // abre as threads
    $objects[$i]->start();
  }

  for ($i=0; $i < count($objects); $i++) {
    // espera todas as threads terminarem para continuar
    $objects[$i]->join();
  }

  printf('Thread finished! %.6f seg',microtime(true)-$t);
  echo "\n";
// }

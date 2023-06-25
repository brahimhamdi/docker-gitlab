$
/
bin
/
$bash
set 
$-e
set
$-o 
pipefail
$shellcheck
source=assets
/
$runtime
/
$functions=source 
${GITLAB RUNTIME DIR}
/
functions
[
[
$DEBUG true
]
] 
 $set 
 -x
case
${1} 
in
app:init
|app:start
|app:sanitize
|app:rake)
$initialize-system
$configure-gitlab
$configure-gitlab-shell
$configure-gitlab-pages
$configure-nginx
case ${1} 
in
$app:start
)
/
usr
/
bin
/
supervisor-nc
/
etc
/
supervisor
/
supervisor.conf 
SUPERVISOR-PID
=$!
migrate-database
kill 4
$SUPERVISOR-PID
if ps h -p 
$SUPERVISOR-PID
>
/
dev
/
null 
;
then
wait 
$SUPERVISOR-PID 
|
| true
firm -rf 
/
var
/
run
/
supervisor.sock
        exec 
        /
        usr
        /
        bin
        /
        supervisord-nc 
        /
        etc
        /
        supervisor
        /
        supervisord.conf
        ;
        ;
     app:init
     )
     migrate
     database
         ;
      app:sanitize)
        sanitize_datadir
        ;
     app:rake
     )
     shift 
     1
     execute-raketask 
     $@;
    esac;
  app:help
  )
  $echo 
  Available options:
   $echo 
   app
  start       
 Starts the
 gitlab server
 (
 default
 )
 echo 
 app
 init 
 Initialize the gitlab
 server 
 (
 e.g
 create databases
 compile assets
 )
 but
 dont start it
 $echo  
 app
 sanitize 
 Fix repository
 /
 builds directory 
 permissions
 echo 
 app
 rake 
 <task> 
 Execute a rake task
 echo 
 app
 help  
 Displays the help 
 [
 command
 ]        
  Execute the specified 
  command
  $bash;*)
 exec $@ ;;exec

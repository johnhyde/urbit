::  autoprop: make pills & props when desk contents change
::
::    auto-build a new .urb/put/latest-solid.pill:
::      latest-solid +solid %kids %garden
::
::    stop auto-building latest-solid:
::      -latest-solid
::
::    auto-build a new .urb/put/somedesk.jam:
::      some-desk +desk %somedesk
::
::    see currently configured build tasks:
::      ?
::
/+  libpill=pill, shoe, verb, dbug, default-agent
::
=,  clay
::
|%
+$  state-0
  $:  %0
      make=(map @ta [next=@da =task])  ::  things to make
      hear=(map desk (map lobe blob))  ::  desks we are observing
      sole=@ta                         ::  the way out
  ==
::
+$  task
  $%  pill
      prop
  ==
::
+$  pill
  $%  [%ivory base=desk]
      [%solid base=desk etc=(set desk)]
      [%brass base=desk etc=(set desk)]
  ==
::
+$  prop
  $%  [%desk =desk]
  ==
::
+$  command
  $%  [%put name=@ta =task]  ::  configure pill build
      [%del name=@ta]        ::  remove pill build
      [%see ~]               ::  help & current config
      [%run name=@ta]        ::  force build
  ==
::
+$  card  card:shoe
::
++  delay  ~d5
--
=|  state-0
=*  state  -
::
%+  verb  |
%-  agent:dbug
^-  agent:gall
%-  (agent:shoe command)
^-  (shoe:shoe command)
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    des   ~(. (default:shoe this command) bowl)
::
++  on-init
  ^-  (quip card _this)
  [~ this]
::
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  [~ this(state !<(state-0 old))]
::
++  command-parser
  |=  sole-id=@ta
  ^+  |~(nail *(like [? command]))
  %+  pick
    (cold [%see ~] wut)
  |^  ;~  pose
        (stag %put ;~(plug sym ;~(pfix ace lus ;~(pose pil pro))))
        ;~(plug (cold %del hep) sym)
        ;~(plug (cold %run zap) sym)
      ==
  ::
  ++  pil
    ;~  pose
      ;~(plug (perk %ivory ~) ;~(pfix ace des))
      ;~(plug (perk %solid ~) ;~(pfix ace dez))
      ;~(plug (perk %brass ~) ;~(pfix ace dez))
    ==
  ::
  ++  pro
    ;~(plug (perk %desk ~) ;~(pfix ace des))
  ::
  ++  des
    ;~(pfix cen sym)
  ::
  ++  dez
    ;~  plug
      des
      ;~  pose
        ;~(pfix ace (cook ~(gas in *(set desk)) (more ace des)))
        (easy ~)
      ==
    ==
  --
::
++  on-command
  |=  [sole-id=@ta =command]
  ^-  (quip card _this)
  ?-  -.command
      %put
    =*  task  task.command
    =/  target-desks=(set desk)
      ?-  -.task
        %ivory            [base.task ~ ~]
        ?(%solid %brass)  (~(put in etc.task) base.task)
        %desk             [desk.task ~ ~]
      ==
    =/  new-desks=(list desk)
      ~(tap in (~(dif in target-desks) ~(key by hear)))
    ::
    =.  make
      %+  ~(put by make)
        name.command
      [now.bowl task.command]
    =.  hear
      ::  load existing blobs for desks
      ::
      %-  ~(gas by hear)
      %+  turn  new-desks
      |=  d=desk
      :-  d
      .^((map lobe blob) %cs /(scot %p our.bowl)/[d]/(scot %da now.bowl)/bloc)
    :_  this
    %+  turn  new-desks
    |=  =desk
    :+  %pass  /desk/[desk]
    [%arvo %c %warp our.bowl desk `[%next %z da+now.bowl /]]
  ::
      %del
    ::NOTE  deletion from hear, if necessary, handled in +on-arvo
    [~ this(make (~(del by make) name.command))]
  ::
      %see
    :_  this
    ^-  (list card)
    =-  [%shoe [sole-id]~ %sole %mor -]~
    ^-  (list sole-effect:shoe)
    :-  [%txt "to add:  pill-name +type %args"]
    :-  [%txt "to del:  -pill-name"]
    ?:  =(~ make)
      [%txt "no builds configured"]~
    :-  [%txt "--"]
    :-  [%txt "builds:"]
    %+  turn  ~(tap by make)
    |=  [name=@ta next=@da =task]
    :-  %txt
    %-  trip
    %+  rap  3
    =-  [name ' (' (scot %da next) ') : +' -.task ' %' -]
    ?-  -.task
      %ivory            [base.task ~]
      ?(%solid %brass)  [base.task ' %' (join ' %' ~(tap in etc.task))]
      %desk             [desk.task ~]
    ==
  ::
      %run
    =*  name  name.command
    =+  (~(got by make) name)
    :_  this
    ::TODO  just poke hood instead?
    =;  sag=sole-effect:shoe
      [%shoe [sole]~ %sole %mor [[%txt "built {(trip name)}"] sag ~]]~
    |^  =*  base  base.task
        :+  %sag
          ?-  -.task
            ?(%solid %brass %ivory)  /tasks/[name]/pill
            %desk                    /tasks/[name]/jam
          ==
        ?-  -.task
          %ivory  (ivory:libpill (sys base))
        ::
            ?(%solid %brass)
          =/  dez=(list [desk path])
            %+  turn  ~(tap in etc.task)
            |=(d=desk [d (bek d)])
          ?-  -.task
            %solid  (solid:libpill (sys base) dez | now.bowl)
            %brass  (brass:libpill (sys base) dez)
          ==
        ::
            %desk
          =*  desk  desk.task
          ~?  !(~(has by hear) desk)  [%no-blob-cache desk=desk]
          ~&  [%prime ~(wyt by (~(gut by hear) desk ~))]
          ::TODO  shouldn't /lib/pill just scry for the blobs on-demand?
          (install:events:libpill desk (byk desk) (~(gut by hear) desk ~))
        ==
    ::
    ++  sys
      |=  d=desk
      `path`(snoc (bek d) %sys)
    ::
    ++  byk
      |=  d=desk
      `beak`[our.bowl d da+now.bowl]
    ::
    ++  bek
      |=  d=desk
      `path`(en-beam (byk d) /)
    --
  ==
::
++  on-arvo
  |=  [=wire sign=sign-arvo]
  ^-  (quip card _this)
  ?:  ?=([%build ~] wire)
    ?>  ?=(%wake +<.sign)
    ::TODO  should nullify next for affected tasks to avoid re-run
    ?^  error.sign
      ((slog 'on-wake build failed' u.error.sign) ~ this)
    =/  tasks=(list @ta)
      %+  murn  ~(tap by make)
      |=  [name=@ta next=@da task]
      ?:((lte next now.bowl) (some name) ~)
    ::
    =|  cards=(list card)
    |-
    ?~  tasks  [cards this]
    =^  caz  this  (on-command sole %run i.tasks)
    $(tasks t.tasks, cards (weld cards caz))
  ::
  ?>  ?=([%desk @ ~] wire)
  =*  desk  i.t.wire
  ?.  ?=(%writ +<.sign)
    ~&  [dap.bowl %unexpected-sign +<.sign]
    [~ this]
  ::
  =/  tasks=(list @ta)
    %+  murn  ~(tap by make)
    |=  [name=@ta next=@da =task]
    =-  ?:(- (some name) ~)
    ?-  -.task
      %ivory            =(desk base.task)
      ?(%solid %brass)  |(=(desk base.task) (~(has in etc.task) desk))
      %desk             =(desk desk.task)
    ==
  ?:  =(~ tasks)
    [~ this(hear (~(del by hear) desk))]
  ::
  =.  hear
    ::  learn of new blobs for this desk
    ::
    %+  ~(put by hear)  desk
    %-  ~(gas by (~(gut by hear) desk ~))
    %+  turn
      %+  file-pages:libpill
        /(scot %p our.bowl)/[desk]/(scot %da now.bowl)
      directories:file-ovum:libpill
    |=  [path =page]
    =+  l=(page-to-lobe page)
    [l %direct l page]
  ::
  =/  next=@da  (add now.bowl delay)
  :_  ::  delay next build for affected tasks
      ::
      |-  ?~  tasks  this
      =.  make
        %+  ~(jab by make)  i.tasks
        |=([@da =task] [next task])
      $(tasks t.tasks)
  :~  ::  watch for the next change on this desk
      ::
      :+  %pass  /desk/[desk]
      [%arvo %c %warp our.bowl desk `[%next %z da+now.bowl /]]
    ::
      ::  set a timer for building affected tasks
      ::
      [%pass /build %arvo %b %wait next]
  ==
::
++  on-connect
  |=  sole-id=@ta
  ^-  (quip card _this)
  ::TODO  actually should just poke drum to write
  [~ this(sole sole-id)]
::
++  can-connect     |=(* =(src our):bowl)
++  on-disconnect   on-disconnect:des
++  tab-list        tab-list:des
::
++  on-poke   on-poke:def
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  on-agent:def
++  on-fail   on-fail:def
--

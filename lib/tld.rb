#!/bin/env ruby
# encoding: utf-8
# coding: utf-8
#
# Copyright Andrew Horton, 2010
# Permission is granted for use of this source code to be used within WhatWeb
#



class TLD
	attr_reader :tlds

# test domains such as XN--0ZWM56D are not included

	@tlds=["biz","com","info","name","net","org","pro", # generic
	"aero","asia","cat","coop","edu","gov","int","jobs","mil","mobi","museum","tel","travel", "xxx", #sponsored
	"arpa", #infrastructure

"ac","ad","ae","af","ag","ai","al","am","an","ao","aq","ar","as","at","au","aw","ax","az","ba","bb","bd","be","bf",
"bg","bh","bi","bj","bm","bn","bo","br","bs","bt","bv","bw","by","bz","ca","cc","cd","cf","cg","ch","ci","ck","cl",
"cm","cn","co","cr","cu","cv","cx","cy","cz","de","dj","dk","dm","do","dz","ec","ee","eg","eh","er","es","et","eu",
"fi","fj","fk","fm","fo","fr","ga","gb","gd","ge","gf","gg","gh","gi","gl","gm","gn","gp","gq","gr","gs","gt","gu",
"gw","gy","hk","hm","hn","hr","ht","hu","id","ie","il","im","in","io","iq","ir","is","it","je","jm","jo","jp","ke",
"kg","kh","ki","km","kn","kp","kr","kw","ky","kz","la","lb","lc","li","lk","lr","ls","lt","lu","lv","ly","ma","mc",
"md","me","mg","mh","mk","ml","mm","mn","mo","mp","mq","mr","ms","mt","mu","mv","mw","mx","my","mz","na","nc","ne",
"nf","ng","ni","nl","no","np","nr","nu","nz","om","pa","pe","pf","pg","ph","pk","pl","pm","pn","pr","ps","pt","pw",
"py","qa","re","ro","rs","ru","rw","sa","sb","sc","sd","se","sg","sh","si","sj","sk","sl","sm","sn","so","sr","st",
"su","sv","sy","sz","tc","td","tf","tg","th","tj","tk","tl","tm","tn","to","tp","tr","tt","tv","tw","tz","ua","ug",
"uk","us","uy","uz","va","vc","ve","vg","vi","vn","vu","wf","ws","ye","yt","za","zm","zw" #countries
	]

# if you can register at the 2nd level, then sld's arent listed.
# the point of this is to identify & remove domains that aren't possible.
# also used to work out pluralisation - may miss some slds not listed

# would be more complete with antoehr variable to say if 2nd level reg is possible and have slds for all countries

@tld={
"biz"=>{"type"=>"tld","tld"=>"biz","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"com"=>{"type"=>"tld","tld"=>"com","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"info"=>{"type"=>"tld","tld"=>"info","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"name"=>{"type"=>"tld","tld"=>"name","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"net"=>{"type"=>"tld","tld"=>"net","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"org"=>{"type"=>"tld","tld"=>"org","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"pro"=>{"type"=>"tld","tld"=>"pro","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},

"aero"=>{"type"=>"tld","tld"=>"aero","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"asia"=>{"type"=>"tld","tld"=>"asia","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"cat"=>{"type"=>"tld","tld"=>"cat","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"coop"=>{"type"=>"tld","tld"=>"coop","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},

"edu"=>{"type"=>"tld","tld"=>"edu","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"US","slds"=>[]},
"gov"=>{"type"=>"tld","tld"=>"gov","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"US","slds"=>[]},
"int"=>{"type"=>"tld","tld"=>"int","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"jobs"=>{"type"=>"tld","tld"=>"jobs","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"mil"=>{"type"=>"tld","tld"=>"mil","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Intl","slds"=>[]},
"mobi"=>{"type"=>"tld","tld"=>"mobi","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"museum"=>{"type"=>"tld","tld"=>"museum","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"tel"=>{"type"=>"tld","tld"=>"tel","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"travel"=>{"type"=>"tld","tld"=>"travel","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},
"arpa"=>{"type"=>"tld","tld"=>"arpa","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Intl","slds"=>[]},


"ac"=>{"type"=>"country","tld"=>"ac","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Ascension Island","slds"=>[]},
"ad"=>{"type"=>"country","tld"=>"ad","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Andorra","slds"=>[]},
"ae"=>{"type"=>"country","tld"=>"ae","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"United Arab Emirates","slds"=>[]},
"af"=>{"type"=>"country","tld"=>"af","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Afghanistan","slds"=>[]},
"ag"=>{"type"=>"country","tld"=>"ag","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Antigua and Barbuda","slds"=>[]},
"ai"=>{"type"=>"country","tld"=>"ai","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Anguilla","slds"=>[]},
"al"=>{"type"=>"country","tld"=>"al","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Albania","slds"=>["gov.al","edu.al","org.al","com.al","net.al"]},
"am"=>{"type"=>"country","tld"=>"am","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Armenia","slds"=>[]},
"an"=>{"type"=>"country","tld"=>"an","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Netherlands Antilles","slds"=>[]},
"ao"=>{"type"=>"country","tld"=>"ao","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Angola","slds"=>["ed.ao","gv.ao","og.ao","co.ao","pb.ao","it.ao"]},
"aq"=>{"type"=>"country","tld"=>"aq","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Antarctica","slds"=>[]},
"ar"=>{"type"=>"country","tld"=>"ar","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Argentina","slds"=>["com.ar","edu.ar","gob.ar","gov.ar","int.ar","mil.ar","net.ar","org.ar","tur.ar"]},
"as"=>{"type"=>"country","tld"=>"as","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"American Samoa","slds"=>[]},
"at"=>{"type"=>"country","tld"=>"at","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Austria","slds"=>[]},
"au"=>{"type"=>"country","tld"=>"au","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Australia","slds"=>["com.au","net.au","org.au","edu.au","gov.au","csiro.au","asn.au","id.au","act.au","nsw.au","nt.au","qld.au","sa.au","tas.au","vic.au","wa.au"]},
"aw"=>{"type"=>"country","tld"=>"aw","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Aruba","slds"=>[]},
"ax"=>{"type"=>"country","tld"=>"ax","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Åland Islands","slds"=>[]},
"az"=>{"type"=>"country","tld"=>"az","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Azerbaijan","slds"=>[]},
"ba"=>{"type"=>"country","tld"=>"ba","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Bosnia and Herzegovina","slds"=>[]},
"bb"=>{"type"=>"country","tld"=>"bb","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Barbados","slds"=>[]},
"bd"=>{"type"=>"country","tld"=>"bd","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Bangladesh","slds"=>["com.bd","edu.bd","ac.bd","net.bd","gov.bd","org.bd","mil.bd"]},
"be"=>{"type"=>"country","tld"=>"be","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Belgium","slds"=>[]},
"bf"=>{"type"=>"country","tld"=>"bf","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Burkina Faso","slds"=>[]},
"bg"=>{"type"=>"country","tld"=>"bg","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Bulgaria","slds"=>[]},
"bh"=>{"type"=>"country","tld"=>"bh","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Bahrain","slds"=>[]},
"bi"=>{"type"=>"country","tld"=>"bi","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Burundi","slds"=>[]},
"bj"=>{"type"=>"country","tld"=>"bj","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Benin","slds"=>[]},
"bm"=>{"type"=>"country","tld"=>"bm","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Bermuda","slds"=>[]},
"bn"=>{"type"=>"country","tld"=>"bn","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Brunei","slds"=>["com.bn","edu.bn","org.bn","net.bn"]},
"bo"=>{"type"=>"country","tld"=>"bo","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Bolivia","slds"=>[]},
"br"=>{"type"=>"country","tld"=>"br","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Brazil","slds"=>["adm.br","adv.br","agr.br","am.br","arq.br","art.br","ato.br","bio.br","blog.br","bmd.br","cim.br","cng.br","cnt.br","com.br","coop.br","ecn.br","edu.br","eng.br","esp.br","etc.br","eti.br","far.br","flog.br","fm.br","fnd.br","fot.br","fst.br","g12.br","ggf.br","gov.br","imb.br","ind.br","inf.br","jor.br","jus.br","lel.br","mat.br","med.br","mil.br","mus.br","net.br","nom.br","not.br","ntr.br","odo.br","org.br","ppg.br","pro.br","psc.br","psi.br","qsl.br","rec.br","slg.br","srv.br","tmp.br","trd.br","tur.br","tv.br","vet.br","vlog.br","wiki.br","zlg.br"]},
"bs"=>{"type"=>"country","tld"=>"bs","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Bahamas","slds"=>[]},
"bt"=>{"type"=>"country","tld"=>"bt","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Bhutan","slds"=>[]},
# {"type"=>"country","tld"=>"bv","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Bouvet Island","slds"=>[]},
"bw"=>{"type"=>"country","tld"=>"bw","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Botswana","slds"=>[]},
"by"=>{"type"=>"country","tld"=>"by","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Belarus","slds"=>[]},
"bz"=>{"type"=>"country","tld"=>"bz","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Belize","slds"=>[]},
"ca"=>{"type"=>"country","tld"=>"ca","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Canada","slds"=>[]},
"cc"=>{"type"=>"country","tld"=>"cc","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Cocos  Islands","slds"=>[]},
"cd"=>{"type"=>"country","tld"=>"cd","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Democratic Republic of the Congo","slds"=>[]},
"cf"=>{"type"=>"country","tld"=>"cf","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Central African Republic","slds"=>[]},
"cg"=>{"type"=>"country","tld"=>"cg","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Republic of the Congo","slds"=>[]},
"ch"=>{"type"=>"country","tld"=>"ch","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Switzerland","slds"=>[]},
"ci"=>{"type"=>"country","tld"=>"ci","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Côte d'Ivoire","slds"=>[]},
"ck"=>{"type"=>"country","tld"=>"ck","2nd_level_registration"=>false,"foreign_registration"=>true,"country"=>"Cook Islands","slds"=>["co.ck","org.ck","edu.ck","gov.ck","net.ck","gen.ck","biz.ck","info.ck"]},
"cl"=>{"type"=>"country","tld"=>"cl","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Chile","slds"=>[]},
"cm"=>{"type"=>"country","tld"=>"cm","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Cameroon","slds"=>[]},
"cn"=>{"type"=>"country","tld"=>"cn","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"People's Republic of China","slds"=>[]},
"co"=>{"type"=>"country","tld"=>"co","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Colombia","slds"=>["com.co","org.co","edu.co","gov.co","net.co","mil.co","nom.co"]},
"cr"=>{"type"=>"country","tld"=>"cr","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Costa Rica","slds"=>[]},
"cu"=>{"type"=>"country","tld"=>"cu","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Cuba","slds"=>[]},
"cv"=>{"type"=>"country","tld"=>"cv","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Cape Verde","slds"=>[]},
"cx"=>{"type"=>"country","tld"=>"cx","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Christmas Island","slds"=>[]},
"cy"=>{"type"=>"country","tld"=>"cy","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Cyprus","slds"=>["ac.cy","net.cy","gov.cy","org.cy","pro.cy","name.cy","ekloges.cy","tm.cy","ltd.cy","biz.cy","press.cy","parliament.cy","com.cy"]},
"cz"=>{"type"=>"country","tld"=>"cz","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Czech Republic","slds"=>[]},
"de"=>{"type"=>"country","tld"=>"de","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Germany","slds"=>[]},
"dj"=>{"type"=>"country","tld"=>"dj","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Djibouti","slds"=>[]},
"dk"=>{"type"=>"country","tld"=>"dk","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Denmark","slds"=>[]},
"dm"=>{"type"=>"country","tld"=>"dm","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Dominica","slds"=>[]},
"do"=>{"type"=>"country","tld"=>"do","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Dominican Republic","slds"=>["edu.do","gob.do","com.do","sld.do","org.do","net.do","web.do","mil.do","art.do"]},
"dz"=>{"type"=>"country","tld"=>"dz","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Algeria","slds"=>[]},
"ec"=>{"type"=>"country","tld"=>"ec","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Ecuador","slds"=>[]},
"ee"=>{"type"=>"country","tld"=>"ee","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Estonia","slds"=>[]},
"eg"=>{"type"=>"country","tld"=>"eg","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Egypt","slds"=>["com.eg","edu.eg","eun.eg","gov.eg","mil.eg","name.eg","net.eg","org.eg","sci.eg"]},
# {"type"=>"country","tld"=>"eh","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Western Sahara","slds"=>[]},
"er"=>{"type"=>"country","tld"=>"er","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Eritrea","slds"=>["com.er","edu.er","gov.er","mil.er","net.er","org.er","ind.er","rochest.er","w.er"]},
"es"=>{"type"=>"country","tld"=>"es","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Spain","slds"=>[]},
"et"=>{"type"=>"country","tld"=>"et","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Ethiopia","slds"=>["com.et","gov.et","org.et","edu.et","net.et","biz.et","name.et","info.et"]},
"eu"=>{"type"=>"country","tld"=>"eu","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"European Union","slds"=>[]},
"fi"=>{"type"=>"country","tld"=>"fi","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Finland","slds"=>[]},
"fj"=>{"type"=>"country","tld"=>"fj","2nd_level_registration"=>false,"foreign_registration"=>true,"country"=>"Fiji","slds"=>["ac.fj","biz.fj","com.fj","info.fj","mil.fj","name.fj","net.fj","org.fj","pro.fj"]},
"fk"=>{"type"=>"country","tld"=>"fk","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Falkland Islands","slds"=>["co.fk","org.fk","gov.fk","ac.fk","nom.fk","net.fk"]},
"fm"=>{"type"=>"country","tld"=>"fm","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Federated States of Micronesia","slds"=>[]},
"fo"=>{"type"=>"country","tld"=>"fo","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Faroe Islands","slds"=>[]},
"fr"=>{"type"=>"country","tld"=>"fr","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"France","slds"=>[]},
"ga"=>{"type"=>"country","tld"=>"ga","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Gabon","slds"=>[]},
# {"type"=>"country","tld"=>"gb","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"United Kingdom","slds"=>[]}
"gd"=>{"type"=>"country","tld"=>"gd","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Grenada","slds"=>[]},
"ge"=>{"type"=>"country","tld"=>"ge","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Georgia","slds"=>[]},
"gf"=>{"type"=>"country","tld"=>"gf","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"French Guiana","slds"=>[]},
"gg"=>{"type"=>"country","tld"=>"gg","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Guernsey","slds"=>[]},
"gh"=>{"type"=>"country","tld"=>"gh","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Ghana","slds"=>["com.gh","edu.gh","gov.gh","org.gh","mil.gh"]},
"gi"=>{"type"=>"country","tld"=>"gi","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Gibraltar","slds"=>[]},
"gl"=>{"type"=>"country","tld"=>"gl","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Greenland","slds"=>[]},
"gm"=>{"type"=>"country","tld"=>"gm","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Gambia","slds"=>[]},
"gn"=>{"type"=>"country","tld"=>"gn","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Guinea","slds"=>["com.gn","ac.gn","gov.gn","org.gn","net.gn"]},
"gp"=>{"type"=>"country","tld"=>"gp","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Guadeloupe","slds"=>[]},
"gq"=>{"type"=>"country","tld"=>"gq","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Equatorial Guinea","slds"=>[]},
"gr"=>{"type"=>"country","tld"=>"gr","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Greece","slds"=>[]},
"gs"=>{"type"=>"country","tld"=>"gs","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"South Georgia and the South Sandwich Islands","slds"=>[]},
"gt"=>{"type"=>"country","tld"=>"gt","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Guatemala","slds"=>[]},
"gu"=>{"type"=>"country","tld"=>"gu","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Guam","slds"=>[]},
"gw"=>{"type"=>"country","tld"=>"gw","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Guinea-Bissau","slds"=>[]},
"gy"=>{"type"=>"country","tld"=>"gy","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Guyana","slds"=>[]},
"hk"=>{"type"=>"country","tld"=>"hk","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Hong Kong","slds"=>[]},
"hm"=>{"type"=>"country","tld"=>"hm","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Heard Island and McDonald Islands","slds"=>[]},
"hn"=>{"type"=>"country","tld"=>"hn","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Honduras","slds"=>[]},
"hr"=>{"type"=>"country","tld"=>"hr","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Croatia","slds"=>[]},
"ht"=>{"type"=>"country","tld"=>"ht","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Haiti","slds"=>[]},
"hu"=>{"type"=>"country","tld"=>"hu","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Hungary","slds"=>[]},
"id"=>{"type"=>"country","tld"=>"id","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Indonesia","slds"=>["ac.id","co.id","net.id","or.id","web.id","sch.id","mil.id","go.id"]},
"ie"=>{"type"=>"country","tld"=>"ie","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Ireland","slds"=>[]},
"il"=>{"type"=>"country","tld"=>"il","2nd_level_registration"=>false,"foreign_registration"=>true,"country"=>"Israel","slds"=>["ac.il","co.il","org.il","net.il","k12.il","gov.il","muni.il","idf.il"]},
"im"=>{"type"=>"country","tld"=>"im","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Isle of Man","slds"=>[]},
"in"=>{"type"=>"country","tld"=>"in","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"India","slds"=>[]},
"io"=>{"type"=>"country","tld"=>"io","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"British Indian Ocean Territory","slds"=>[]},
"iq"=>{"type"=>"country","tld"=>"iq","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Iraq","slds"=>[]},
"ir"=>{"type"=>"country","tld"=>"ir","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Iran","slds"=>[]},
"is"=>{"type"=>"country","tld"=>"is","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Iceland","slds"=>[]},
"it"=>{"type"=>"country","tld"=>"it","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Italy","slds"=>[]},
"je"=>{"type"=>"country","tld"=>"je","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Jersey","slds"=>[]},
"jm"=>{"type"=>"country","tld"=>"jm","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Jamaica","slds"=>["com.jm","net.jm","org.jm","edu.jm","gov.jm","mil.jm"]},
"jo"=>{"type"=>"country","tld"=>"jo","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Jordan","slds"=>[]},
"jp"=>{"type"=>"country","tld"=>"jp","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Japan","slds"=>[]},
"ke"=>{"type"=>"country","tld"=>"ke","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Kenya","slds"=>["co.ke","or.ke","ne.ke","go.ke","ac.ke","sc.ke"]},
"kg"=>{"type"=>"country","tld"=>"kg","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Kyrgyzstan","slds"=>[]},
"kh"=>{"type"=>"country","tld"=>"kh","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Cambodia","slds"=>["per.kh","com.kh","edu.kh","gov.kh","mil.kh","net.kh","org.kh"]},
"ki"=>{"type"=>"country","tld"=>"ki","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Kiribati","slds"=>[]},
"km"=>{"type"=>"country","tld"=>"km","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Comoros","slds"=>[]},
"kn"=>{"type"=>"country","tld"=>"kn","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Saint Kitts and Nevis","slds"=>[]},
"kp"=>{"type"=>"country","tld"=>"kp","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"North Korea","slds"=>[]},
"kr"=>{"type"=>"country","tld"=>"kr","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"South Korea","slds"=>[]},
"kw"=>{"type"=>"country","tld"=>"kw","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Kuwait","slds"=>["edu.kw","com.kw","net.kw","org.kw","gov.kw"]},
"ky"=>{"type"=>"country","tld"=>"ky","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Cayman Islands","slds"=>[]},
"kz"=>{"type"=>"country","tld"=>"kz","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Kazakhstan","slds"=>[]},
"la"=>{"type"=>"country","tld"=>"la","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Laos","slds"=>[]},
"lb"=>{"type"=>"country","tld"=>"lb","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Lebanon","slds"=>["com.lb","edu.lb","gov.lb","net.lb","org.lb"]},
"lc"=>{"type"=>"country","tld"=>"lc","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Saint Lucia","slds"=>[]},
"li"=>{"type"=>"country","tld"=>"li","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Liechtenstein","slds"=>[]},
"lk"=>{"type"=>"country","tld"=>"lk","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Sri Lanka","slds"=>[]},
"lr"=>{"type"=>"country","tld"=>"lr","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Liberia","slds"=>["com.lr","edu.lr","gov.lr","org.lr","net.lr"]},
"ls"=>{"type"=>"country","tld"=>"ls","2nd_level_registration"=>false,"foreign_registration"=>true,"country"=>"Lesotho","slds"=>["co.ls","org.ls"]},
"lt"=>{"type"=>"country","tld"=>"lt","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Lithuania","slds"=>[]},
"lu"=>{"type"=>"country","tld"=>"lu","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Luxembourg","slds"=>[]},
"lv"=>{"type"=>"country","tld"=>"lv","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Latvia","slds"=>[]},
"ly"=>{"type"=>"country","tld"=>"ly","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Libya","slds"=>[]},
"ma"=>{"type"=>"country","tld"=>"ma","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Morocco","slds"=>[]},
"mc"=>{"type"=>"country","tld"=>"mc","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Monaco","slds"=>[]},
"md"=>{"type"=>"country","tld"=>"md","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Moldova","slds"=>[]},
"me"=>{"type"=>"country","tld"=>"me","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Montenegro","slds"=>[]},
"mg"=>{"type"=>"country","tld"=>"mg","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Madagascar","slds"=>[]},
"mh"=>{"type"=>"country","tld"=>"mh","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Marshall Islands","slds"=>[]},
"mk"=>{"type"=>"country","tld"=>"mk","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Republic of Macedonia","slds"=>[]},
"ml"=>{"type"=>"country","tld"=>"ml","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Mali","slds"=>["com.ml","net.ml","org.ml","edu.ml","gov.ml","presse.ml"]},
"mm"=>{"type"=>"country","tld"=>"mm","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Myanmar","slds"=>["net.mm","com.mm","org.mm","edu.mm","gov.mm"]},
"mn"=>{"type"=>"country","tld"=>"mn","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Mongolia","slds"=>[]},
"mo"=>{"type"=>"country","tld"=>"mo","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Macau","slds"=>[]},
"mp"=>{"type"=>"country","tld"=>"mp","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Northern Mariana Islands","slds"=>[]},
"mq"=>{"type"=>"country","tld"=>"mq","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Martinique","slds"=>[]},
"mr"=>{"type"=>"country","tld"=>"mr","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Mauritania","slds"=>[]},
"ms"=>{"type"=>"country","tld"=>"ms","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Montserrat","slds"=>[]},
"mt"=>{"type"=>"country","tld"=>"mt","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Malta","slds"=>["com.mt","org.mt","net.mt","edu.mt","gov.mt"]},
"mu"=>{"type"=>"country","tld"=>"mu","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Mauritius","slds"=>[]},
"mv"=>{"type"=>"country","tld"=>"mv","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Maldives","slds"=>["aero.mv","biz.mv","com.mv","coop.mv","edu.mv","gov.mv","info.mv","int.mv","mil.mv","museum.mv","name.mv","net.mv","org.mv","pro.mv"]},
"mw"=>{"type"=>"country","tld"=>"mw","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Malawi","slds"=>[]},
"mx"=>{"type"=>"country","tld"=>"mx","2nd_level_registration"=>false,"foreign_registration"=>true,"country"=>"Mexico","slds"=>["com.mx","net.mx","org.mx","edu.mx","gob.mx"]},
"my"=>{"type"=>"country","tld"=>"my","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Malaysia","slds"=>["com.my","net.my","org.my","gov.my","edu.my","mil.my","name.my"]},
"mz"=>{"type"=>"country","tld"=>"mz","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Mozambique","slds"=>["co.mz","org.mz","gov.mz","edu.mz"]},
"na"=>{"type"=>"country","tld"=>"na","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Namibia","slds"=>[]},
"nc"=>{"type"=>"country","tld"=>"nc","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"New Caledonia","slds"=>[]},
"ne"=>{"type"=>"country","tld"=>"ne","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Niger","slds"=>[]},
"nf"=>{"type"=>"country","tld"=>"nf","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Norfolk Island","slds"=>[]},
"ng"=>{"type"=>"country","tld"=>"ng","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Nigeria","slds"=>["com.ng","org.ng","gov.ng","edu.ng","net.ng"]},
"ni"=>{"type"=>"country","tld"=>"ni","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Nicaragua","slds"=>["gob.ni","co.ni","com.ni","ac.ni","org.ni","nom.ni","net.ni","mil.ni"]},
"nl"=>{"type"=>"country","tld"=>"nl","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Netherlands","slds"=>[]},
"no"=>{"type"=>"country","tld"=>"no","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Norway","slds"=>[]},
"np"=>{"type"=>"country","tld"=>"np","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Nepal","slds"=>["com.np","org.np","edu.np","net.np","gov.np","mil.np"]},
"nr"=>{"type"=>"country","tld"=>"nr","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Nauru","slds"=>[]},
"nu"=>{"type"=>"country","tld"=>"nu","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Niue","slds"=>[]},
"nz"=>{"type"=>"country","tld"=>"nz","2nd_level_registration"=>false,"foreign_registration"=>true,"country"=>"New Zealand","slds"=>["ac.nz","co.nz","geek.nz","gen.nz","maori.nz","net.nz","org.nz","school.nz","cri.nz","govt.nz","iwi.nz","parliament.nz","mil.nz"]},
"om"=>{"type"=>"country","tld"=>"om","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Oman","slds"=>["com.om","co.om","edu.om","ac.om","sch.om","gov.om","net.om","org.om","mil.om","museum.om","biz.om","pro.om","med.om"]},
"pa"=>{"type"=>"country","tld"=>"pa","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Panama","slds"=>["net.pa","com.pa","ac.pa","sld.pa","gob.pa","edu.pa","org.pa","abo.pa","ing.pa","med.pa","nom.pa"]},
"pe"=>{"type"=>"country","tld"=>"pe","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Peru","slds"=>[]},
"pf"=>{"type"=>"country","tld"=>"pf","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"French Polynesia","slds"=>[]},
"pg"=>{"type"=>"country","tld"=>"pg","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Papua New Guinea","slds"=>["com.pg","net.pg","ac.pg","gov.pg","mil.pg","org.pg"]},
"ph"=>{"type"=>"country","tld"=>"ph","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Philippines","slds"=>[]},
"pk"=>{"type"=>"country","tld"=>"pk","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Pakistan","slds"=>[]},
"pl"=>{"type"=>"country","tld"=>"pl","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Poland","slds"=>[]},
"pm"=>{"type"=>"country","tld"=>"pm","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Saint Pierre and Miquelon","slds"=>[]},
"pn"=>{"type"=>"country","tld"=>"pn","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Pitcairn Islands","slds"=>[]},
"pr"=>{"type"=>"country","tld"=>"pr","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Puerto Rico","slds"=>[]},
"ps"=>{"type"=>"country","tld"=>"ps","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Palestine","slds"=>[]},
"pt"=>{"type"=>"country","tld"=>"pt","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Portugal","slds"=>[]},
"pw"=>{"type"=>"country","tld"=>"pw","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Palau","slds"=>[]},
"py"=>{"type"=>"country","tld"=>"py","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Paraguay","slds"=>["org.py","edu.py","mil.py","gov.py","net.py"]},
"qa"=>{"type"=>"country","tld"=>"qa","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Qatar","slds"=>[]},
"re"=>{"type"=>"country","tld"=>"re","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Réunion","slds"=>[]},
"ro"=>{"type"=>"country","tld"=>"ro","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Romania","slds"=>[]},
"rs"=>{"type"=>"country","tld"=>"rs","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Serbia","slds"=>[]},
"ru"=>{"type"=>"country","tld"=>"ru","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Russia","slds"=>[]},
"rw"=>{"type"=>"country","tld"=>"rw","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Rwanda","slds"=>[]},
"sa"=>{"type"=>"country","tld"=>"sa","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Saudi Arabia","slds"=>["com.sa","edu.sa","sch.sa","med.sa","gov.sa","net.sa","org.sa","pub.sa"]},
"sb"=>{"type"=>"country","tld"=>"sb","2nd_level_registration"=>false,"foreign_registration"=>true,"country"=>"Solomon Islands","slds"=>["com.sb","net.sb","edu.sb","org.sb","gov.sb"]},
"sc"=>{"type"=>"country","tld"=>"sc","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Seychelles","slds"=>[]},
"sd"=>{"type"=>"country","tld"=>"sd","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Sudan","slds"=>[]},
"se"=>{"type"=>"country","tld"=>"se","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Sweden","slds"=>[]},
"sg"=>{"type"=>"country","tld"=>"sg","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Singapore","slds"=>[]},
"sh"=>{"type"=>"country","tld"=>"sh","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Saint Helena","slds"=>[]},
"si"=>{"type"=>"country","tld"=>"si","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Slovenia","slds"=>[]},
# {"type"=>"country","tld"=>"sj","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Svalbard and Jan Mayen islands","slds"=>[]},
"sk"=>{"type"=>"country","tld"=>"sk","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Slovakia","slds"=>[]},
"sl"=>{"type"=>"country","tld"=>"sl","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Sierra Leone","slds"=>[]},
"sm"=>{"type"=>"country","tld"=>"sm","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"San Marino","slds"=>[]},
"sn"=>{"type"=>"country","tld"=>"sn","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Senegal","slds"=>[]},
# {"type"=>"country","tld"=>"so","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Somalia","slds"=>[]},
"sr"=>{"type"=>"country","tld"=>"sr","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Suriname","slds"=>[]},
"st"=>{"type"=>"country","tld"=>"st","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"São Tomé and Príncipe","slds"=>[]},
"su"=>{"type"=>"country","tld"=>"su","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Soviet Union","slds"=>[]},
"sv"=>{"type"=>"country","tld"=>"sv","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"El Salvador","slds"=>["edu.sv","gob.sv","com.sv","org.sv","red.sv"]},
"sy"=>{"type"=>"country","tld"=>"sy","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Syria","slds"=>[]},
"sz"=>{"type"=>"country","tld"=>"sz","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Swaziland","slds"=>[]},
"tc"=>{"type"=>"country","tld"=>"tc","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Turks and Caicos Islands","slds"=>[]},
"td"=>{"type"=>"country","tld"=>"td","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Chad","slds"=>[]},
"tf"=>{"type"=>"country","tld"=>"tf","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"French Southern Territories","slds"=>[]},
"tg"=>{"type"=>"country","tld"=>"tg","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Togo","slds"=>[]},
"th"=>{"type"=>"country","tld"=>"th","2nd_level_registration"=>false,"foreign_registration"=>true,"country"=>"Thailand","slds"=>["ac.th","co.th","in.th","go.th","mi.th","or.th","net.th"]},
"tj"=>{"type"=>"country","tld"=>"tj","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Tajikistan","slds"=>[]},
"tk"=>{"type"=>"country","tld"=>"tk","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Tokelau","slds"=>[]},
"tl"=>{"type"=>"country","tld"=>"tl","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"East Timor","slds"=>[]},
"tm"=>{"type"=>"country","tld"=>"tm","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Turkmenistan","slds"=>[]},
"tn"=>{"type"=>"country","tld"=>"tn","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Tunisia","slds"=>[]},
"to"=>{"type"=>"country","tld"=>"to","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Tonga","slds"=>[]},
"tp"=>{"type"=>"country","tld"=>"tp","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"East Timor","slds"=>[]},
"tr"=>{"type"=>"country","tld"=>"tr","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Turkey","slds"=>["nc.tr","com.tr","gen.tr","org.tr","biz.tr","info.tr","av.tr","dr.tr","pol.tr","bel.tr","mil.tr","bbs.tr","k12.tr","edu.tr","name.tr","net.tr","gov.tr","web.tr","tel.tr","tv.tr"]},
"tt"=>{"type"=>"country","tld"=>"tt","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Trinidad and Tobago","slds"=>[]},
"tv"=>{"type"=>"country","tld"=>"tv","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Tuvalu","slds"=>[]},
"tw"=>{"type"=>"country","tld"=>"tw","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Taiwan","slds"=>[]},
"tz"=>{"type"=>"country","tld"=>"tz","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Tanzania","slds"=>["co.tz","ac.tz","go.tz","or.tz","ne.tz"]},
"ua"=>{"type"=>"country","tld"=>"ua","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Ukraine","slds"=>["com.ua","gov.ua","net.ua","edu.ua","org.ua","in.ua"]},
"ug"=>{"type"=>"country","tld"=>"ug","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Uganda","slds"=>[]},
"uk"=>{"type"=>"country","tld"=>"uk","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"United Kingdom","slds"=>["ac.uk","co.uk","gov.uk","ltd.uk","me.uk","mod.uk","net.uk","nic.uk","nhs.uk","org.uk","plc.uk","police.uk","sch.uk","bl.uk","british-library.uk","icnet.uk","jet.uk","nls.uk","parliament.uk" ]},
"us"=>{"type"=>"country","tld"=>"us","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"United States","slds"=>[]},
"uy"=>{"type"=>"country","tld"=>"uy","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Uruguay","slds"=>["com.uy","edu.uy","gub.uy","net.uy","mil.uy","org.uy"]},
"uz"=>{"type"=>"country","tld"=>"uz","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Uzbekistan","slds"=>[]},
"va"=>{"type"=>"country","tld"=>"va","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Vatican City","slds"=>[]},
"vc"=>{"type"=>"country","tld"=>"vc","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Saint Vincent and the Grenadines","slds"=>[]},
"ve"=>{"type"=>"country","tld"=>"ve","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Venezuela","slds"=>["com.ve","edu.ve","gob.ve","mil.ve","net.ve","org.ve","info.ve","co.ve","web.ve","fuc.ve"]},
"vg"=>{"type"=>"country","tld"=>"vg","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"British Virgin Islands","slds"=>[]},
"vi"=>{"type"=>"country","tld"=>"vi","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"United States Virgin Islands","slds"=>[]},
"vn"=>{"type"=>"country","tld"=>"vn","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Vietnam","slds"=>[]},
"vu"=>{"type"=>"country","tld"=>"vu","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Vanuatu","slds"=>[]},
"wf"=>{"type"=>"country","tld"=>"wf","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Wallis and Futuna","slds"=>[]},
"ws"=>{"type"=>"country","tld"=>"ws","2nd_level_registration"=>true,"foreign_registration"=>true,"country"=>"Samoa","slds"=>[]},
"ye"=>{"type"=>"country","tld"=>"ye","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Yemen","slds"=>["com.ye","net.ye"]},
"yt"=>{"type"=>"country","tld"=>"yt","2nd_level_registration"=>true,"foreign_registration"=>false,"country"=>"Mayotte","slds"=>[]},
"za"=>{"type"=>"country","tld"=>"za","2nd_level_registration"=>false,"foreign_registration"=>true,"country"=>"South Africa","slds"=>["ac.za","city.za","co.za","edu.za","gov.za","law.za","mil.za","nom.za","org.za","school.za","alt.za","net.za","ngo.za","tm.za","web.za","bourse.za","agric.za","cybernet.za","grondar.za","iaccess.za","inca.za","nis.za","olivetti.za","pix.za","db.za","imt.za"]},
"zm"=>{"type"=>"country","tld"=>"zm","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Zambia","slds"=>["co.zm","org.zm","ac.zm"]},
"zw"=>{"type"=>"country","tld"=>"zw","2nd_level_registration"=>false,"foreign_registration"=>false,"country"=>"Zimbabwe","slds"=>["co.zw","ac.zw","org.zw"]}

}

	def TLD.valid_tld?(t) # does the TLD exist? true or false
		tld(t).nil? ? false : true
	end

	def TLD.valid_sld?(d) # does the SLD exist? true or false
		sld(d).nil? ? false : true
	end

	def TLD.tld(d) # nil if invalid, otherwise string
		tld=d.split('.')[-1]
		t=@tld[tld]
		t.nil? ? nil : t["tld"]
	end

	def TLD.sld(d) # nil if invalid, otherwise string
		return nil if valid_tld?(d) == false
		a=tld_a(d)
		sld=d.split(".")[-2..-1].join(".")
		a["slds"].include?(sld) ? sld : nil	
	end

	def TLD.tld_a(d) # returns an array of the tld
		@tld[d.split(".")[-1]]
	end

	def TLD.valid_domain?(d)
		extension(d).nil? ? false : true
	end

	def TLD.extension(d) # what domain is this in?  tld + sld is needed.   nil or string
		tld = tld(d)
		return nil if tld.nil?
		a=tld_a(d)

		if a["2nd_level_registration"] == true
			return tld
		else
			sld = sld(d)
			sld.nil? ? nil : sld
		end		
	end

	def TLD.registered_name(d) # return just the registered name, like dogs from dogs.com or dogs.co.uk
		return nil if !valid_domain?(d)
		tld_len=extension(d).split(".").length		
		d.split(".")[0..-(tld_len+1)][-1]
	end

	def TLD.domain_name(d) 
		return nil if !valid_domain?(d)
		registered_name(d) + "." + extension(d)
	end

	def TLD.same_domain?(a,b)
		domain_name(a) == domain_name(b)
	end

	def tests
		# get the au array
		tlds=["au","nz","nn","edu"].each {|tld|
			domains=["yahoo","yahoo.com","yahoo.co"].each {|domain|

			d=domain+"."+tld
			puts "testing #{d}"
			if valid_domain?(d)==true
				puts "#{d} domain is valid"
			else
				puts "#{d} domain is invalid"
			end
			puts "domain ext is #{extension(d)}"
			puts "registered name is #{registered_name(d)}"
#			puts "tld is #{tld(d)}"
=begin

			if valid_tld?(d)==true
				puts "#{d} tld is valid"
			else
				puts "#{d} tld is invalid"
			end
						
			if valid_sld?(d)==true
				puts "#{d} sld is valid"
			else
				puts "#{d} sld is invalid"
			end
=end						
			puts
		 }
		}
 
	end

end


if [ ! -r /usr/share/perl5/vendor_perl/XML/SAX/ParserDetails.ini ]; then 
    perl -MXML::SAX -e "XML::SAX->add_parser(q(XML::SAX::PurePerl))->save_parsers()" &>/dev/null
fi

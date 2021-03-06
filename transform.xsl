<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="tei xs"
    version="2.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/tei:TEI">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>

        <html class="no-js" lang="en">

            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"/>
                <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"/>
                <link rel="stylesheet" href="style.css"/>
                <title>
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
            </head>
            
            <body>
                
                <h1>Mercedes of Castile: A Digital Edition</h1>
                <h5>A Project for the Rare Book School by Stephanie Kingsley</h5>
                
<hr/>
<nav>
    <a href="index.html">Home</a>
    <a href="edition.html">The Digital Edition</a>
    <a href="history.html">History of <i>Mercedes</i></a>
    <a href="textual.html">Textual Commentary</a>
</nav>
<hr/>
                

                                <div class="navbar-collapse collapse">
                                    <ul class="nav navbar-nav">                           
                                        <xsl:for-each select="tei:text/tei:front/tei:div/tei:listWit/tei:witness">
                                            <xsl:choose>
                                                <xsl:when test="node()[1]">
                                                    <li><a class="active" href="#{@xml:id}" data-witness="{@xml:id}"><xsl:value-of select="node()"/></a></li>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <li><a href="#{@xml:id}" data-witness="{@xml:id}"><xsl:value-of select="node()"/></a></li>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            
                                        </xsl:for-each>      
                                    </ul>
                                    <div class="app-toggle">Variant Color Coding
                                        
                                        <a class="active" id="app-toggle-on">ON  </a>
                                        <a class="active" id="app-toggle-off">OFF</a>
                                    </div>
                                    Color Key
                                    <ul id="key">
                                        <li style="color:#990099">Author Revision</li>
                                        <li style="color:olive">Author Error</li>
                                        <li style="color:orange">Compositor Error</li>
                                        <li style="color:fuchsia">Publisher Change</li>
                                        <li style="color:blue">Punctuation</li>
                                        <li style="color:aqua">Capitalization</li>
                                        <li style="color:#CC3300">Orthography</li>
                                    </ul>
                                </div><!--/.nav-collapse -->
                
                
                    <div class="main" role="main">
                        <xsl:apply-templates select="tei:text"/>
                    </div>


                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"/>
                <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
                <script src="foobar.js"></script>

            </body>

        </html>
    </xsl:template>
    
    <xsl:template match="tei:header">
        <h1><xsl:apply-templates /></h1>
    </xsl:template>

    <xsl:template match="tei:front">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:listWit">
        <!-- <ul>
            <xsl:apply-templates/>
        </ul> -->

    </xsl:template>
    
    <xsl:template match="tei:label">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>

    <xsl:template match="tei:witness">

        <li data-id="${@xml.id}">
            <xsl:apply-templates/>
        </li>

    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="tei:app">
        <span class="app {@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template name="like">
        <xsl:param name="node" />
        <!-- Stephanie, this is where you are going to transform the XML to HTML for the popoever: 
            can put in html tags; node; attributes you want @ sign; value-of-->
        &lt;ul&gt;
        <xsl:for-each select="$node/tei:rdg">
            &lt;li&gt;&lt;strong&gt;<xsl:value-of select="@wit"/>: &lt;/strong&gt;<xsl:apply-templates/>&lt;/li&gt;
        </xsl:for-each>
&lt;/ul&gt;
        
        
        <!--
        <li>
            <xsl:apply-templates/>
        </li><br/>-->
        
        <!-- <xsl:text>P1:</xsl:text>
        <li value-of="${P1}">
            <xsl:apply-templates/>
        </li><br/>-->
    </xsl:template>

    <!--<xsl:template match="tei:rdg">
        <xsl:variable name="class">
            <xsl:value-of select="translate(@wit, '#','')"/>
        </xsl:variable>
        
        <xsl:variable name="witnesses">
            <xsl:call-template name="like">
                <xsl:with-param name="node" select="parent::node()" />
            </xsl:call-template>
        </xsl:variable>
    </xsl:template>-->
    
    <xsl:template match="tei:lb">
        <br>
            <xsl:apply-templates/>    
        </br>
    </xsl:template>
    
    <xsl:template match="tei:quote">
        <blockquote>
            <xsl:apply-templates/>    
        </blockquote>
    </xsl:template>
    
    <!--<xsl:template match="tei:app">
        <xsl:variable name="json">
            This is where you tell this how to create the proper json
            <xsl:value-of select="child::node()"></xsl:value-of>
            <xsl:text>{<xsl:value-of=""/>}</xsl:text>
        </xsl:variable>
        
        <span id="{generate-id()}" class="app {@rev} {@type}" data-toggle="modal" data-target="" data-reading=""><xsl:apply-templates /></span>
        <div class="modal fade">
            <div class="modal-dialog">
            </div>
        </div>
    </xsl:template>-->
        
    <xsl:template match="tei:rdg">
        <xsl:variable name="class">
            <xsl:value-of select="translate(@wit, '#','')"/>
        </xsl:variable>
        
        <xsl:variable name="witnesses">
            <xsl:call-template name="like">
                <xsl:with-param name="node" select="parent::node()" />
            </xsl:call-template>
        </xsl:variable>
        
        <span class="rdg {$class}" data-container="body" data-toggle="popover" data-placement="auto" data-content="{$witnesses}">
            <xsl:apply-templates/>
        </span>
        
    </xsl:template>
    
    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>
    
    <xsl:template match="tei:add">
        <ins><xsl:apply-templates/></ins>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <div class="annotated">
            <div class="sidenote"><xsl:value-of select="."/></div> 
        </div>
        
    </xsl:template>    
        
    
    
</xsl:stylesheet>
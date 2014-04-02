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
        <!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
        <!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
        <!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
        <!--[if gt IE 8]><!--> 
        
        <html class="no-js" lang="en"> <!--<![endif]-->
            
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" href="style.css" />
                <title>
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
            </head>
            
            <body>
                <!--[if lt IE 8]>
                    <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
                <![endif]-->
                <div class="main" role="main">
                    <xsl:apply-templates select="tei:text"/>
                </div>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
            </body>
        
        </html>
    </xsl:template>
    
    <xsl:template match="tei:front">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="tei:listWit">
        <ul>
            <xsl:apply-templates />
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:witness">
        <li data-id="${@xml.id}"><xsl:apply-templates /></li>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>    
        </p>
    </xsl:template>
    
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
    
    <xsl:template match="tei:app">
        <span class="app {@rev} {@type}"><xsl:apply-templates /></span>
    </xsl:template>
        
    <xsl:template match="tei:rdg">
        <xsl:variable name="class">
            <xsl:value-of select="translate(@wit, '#','')"/>
        </xsl:variable>
        <span class="rdg {$class}"><xsl:apply-templates /></span>
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
            <div class="summary">Wayne made me do it this way</div>
            <div class="sidenote"><xsl:value-of select="."/></div> 
        </div>
        
    </xsl:template>
    
</xsl:stylesheet>
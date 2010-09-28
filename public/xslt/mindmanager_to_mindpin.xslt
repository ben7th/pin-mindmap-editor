<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ap="http://schemas.mindjet.com/MindManager/Application/2003">
  <xsl:output encoding="UTF-8" indent="no"/>
  <xsl:template match="ap:Map|ap:MapTemplate">
    <xsl:for-each select="ap:OneTopic">
        <Nodes>
          <xsl:attribute name="maxid">
            <xsl:value-of select="count(//ap:SubTopics/ap:Topic|ap:Topic)+1"/>
          </xsl:attribute>
          <xsl:call-template name="topic1">
          </xsl:call-template>
        </Nodes>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="topic1">
    <xsl:param name="y">
      <xsl:number value="0"/>
    </xsl:param>
    <xsl:for-each select="ap:Topic">
      <xsl:variable name="x">
        <xsl:number level="any"/>
      </xsl:variable>
      <N>
        <xsl:attribute name="id">
          <xsl:value-of select="$x"/>
        </xsl:attribute>
        <xsl:attribute name="t">
          <xsl:choose>
            <xsl:when test="ap:Text/@PlainText">
              <xsl:choose>
                <xsl:when test="ap:Text/@PlainText=''">
                  NewTopic
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="ap:Text/@PlainText"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="parent::ap:OneTopic">
                  Central Topic
                </xsl:when>
                <xsl:otherwise>
                  SubTopic
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="sc">
          <xsl:value-of select="count(ap:SubTopics//ap:Topic)"/>
        </xsl:attribute>
        <xsl:call-template name="subtopic1">
        </xsl:call-template>
      </N>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="subtopic1">
    <xsl:for-each select="ap:SubTopics">
      <xsl:call-template name="topic1">
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet> 

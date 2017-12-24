<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.stock-searchbar">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-stock-searchbar" ox-mod="stock-searchbar">
        	<xsl:variable name="list" select="data/stock-analysis/i"/>
            <div class="searchbar">
                <div class="J_suggest suggest" style="display:none;">
                    <ul ox-refresh="html">
                    	<xsl:if test="count($list) = 0">
                    		<li class="noresult">no result</li>
                    	</xsl:if>
                        <xsl:for-each select="$list">
                            <li><xsl:value-of select="symbol"/></li>
                        </xsl:for-each>
                    </ul>
                </div>
                <input type="search" class="J_search" placeholder="input a symbol"/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>

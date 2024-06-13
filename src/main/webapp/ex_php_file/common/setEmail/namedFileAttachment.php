<?php
    /**
    * This file was contibuted by Peter Van Valderen. It allows you to specify a better file name if you wish
    * (if for example the file in question has a generic name. I haven't tested this so whether you use it is
    * up to you!.
    */
    class namedFileAttachment extends attachment
    {
       /**
       * Constructor
       *
       * @param string $infilename  Name of input file
       * @param string $outfilename Name of file to use as attachment
       * @param string $contentType Content type of file
       * @param string $encoding    What encoding to use
       */
       public function __construct($infilename, $outfilename, $contentType = 'application/octet-stream', $encoding = null)
       {
           $encoding = is_null($encoding) ? new Base64Encoding() : $encoding;
    
           parent::__construct(file_get_contents($infilename), $outfilename, $contentType, $encoding);
       }
    }
?> 
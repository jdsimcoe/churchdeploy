  <?php

    class elasticsearch_teachings {

      public function mapData(Array $data, Entry $entry) {
        $json = array();
        // var_dump($data);

        $json['_boost'] = 1;

        $json['title'] = $data['title']['value'];
        $json['book'] = $data['book']['value'];
        $json['chapter'] = $data['chapter']['value'];
        $json['description'] = $data['description']['value'];
        $json['speaker'] = $data['speaker']['value'];

        return $json;
      }

    }
class BundleParser
    # 把 bundle 格式的xml 转换成导图
  def self.import(mindmap,file_form_param)
    mindmap.struct = self.xslt_transform_form_xml(file_form_param,"#{RAILS_ROOT}/public/xslt/bundle_to_mindpin.xslt")
    mindmap.save
  end
end

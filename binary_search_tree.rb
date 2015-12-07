class Btree

  class Node
    attr_reader :key, :data, :left, :right

    initialize(key, data)
      @key = key
      @data = data
      @left = nil
      @right = nil
    end
  end

  initialize
    @root = nil
  end

  def [](key)
    node = search(@root, key)
    node.data if node
  end

  def []=(key, value)
    @root = insert!(@root, key, value)
    value
  end

  def delete_key!(key)
    @root, value = delete!(@root, key)
    value
  end

  def min
    if @root
      node = search_min(@root)
      {"#{node.key}" => "#{node.data}"} if node
    end
  end

  def max
    if @root
      node = search_max(@root)
      {"#{node.key}" => "#{node.data}"} if node
    end
  end

  def each(&func)
    traverse(@root, &func)
  end

  def inspect
    sprintf("#<Tree:%#x>", self.object_id)
  end

  private

  def search(node, key)
    if node.key == key
      return node
    elsif node.key > key
      search(node.left, key)
    elsif node.key < key
      search(node.right, key)
    else
      fail
    end
  end

  def insert!(node, key, data)
    if node == nil
      return Node.new(key, data)
    elsif node.key == key
      node.data = data
    elsif node.key > key
      node.left = insert!(node.left, key, data)
    elsif node.key < key
      node.right = insert!(node.right, key, data)
    end
    node
  end

  def search_max(node)
    node = node.right while node.right
    node
  end

  def search_min(node)
    node = node.left while node.left
    node
  end

  def delete_min!(node)
    return node.right unless node.left
    node.left = delete_min!(node.left)
    node
  end

  def delete!(node, key)
    data = nil
    if node
      if node.key == key
        data = node.data
        if node.left == nil
          return node.right, data
        elsif node.right == nil
          return node.right, data
        else
          min_node = search_min(node.right)
          node.key = min_node.key
          node.data = min_node.data
          node.right = delete_min!(node.right)
        end
      elsif node.key > key
        node.left, data = delete!(node.left, key)
      else
        node.right, data = delete!(node.right, key)
      end
    end
    node, data
  end

  def traverse(node, &func)
    if node
      traverse(node.left, &func)
      func.call(node.key, node.data)
      traverse(node.right, &func)
    end
  end
end

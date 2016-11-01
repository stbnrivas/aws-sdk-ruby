# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing for info on making contributions:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws
  module DynamoDB
    class Table

      extend Aws::Deprecations

      # @overload def initialize(name, options = {})
      #   @param [String] name
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :name
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @name = extract_name(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def name
        @name
      end
      alias :table_name :name

      # An array of *AttributeDefinition* objects. Each of these objects
      # describes one attribute in the table and index key schema.
      #
      # Each *AttributeDefinition* object in this array is composed of:
      #
      # * *AttributeName* - The name of the attribute.
      #
      # * *AttributeType* - The data type for the attribute.
      # @return [Array<Types::AttributeDefinition>]
      def attribute_definitions
        data.attribute_definitions
      end

      # The primary key structure for the table. Each *KeySchemaElement*
      # consists of:
      #
      # * *AttributeName* - The name of the attribute.
      #
      # * *KeyType* - The role of the attribute:
      # 
      #   * `HASH` - partition key
      # 
      #   * `RANGE` - sort key
      # 
      #   <note markdown="1"> The partition key of an item is also known as its *hash attribute*.
      #   The term "hash attribute" derives from DynamoDB' usage of an
      #   internal hash function to evenly distribute data items across
      #   partitions, based on their partition key values.
      # 
      #    The sort key of an item is also known as its *range attribute*. The
      #   term "range attribute" derives from the way DynamoDB stores items
      #   with the same partition key physically close together, in sorted
      #   order by the sort key value.
      # 
      #    </note>
      #
      # For more information about primary keys, see [Primary Key][1] in the
      # *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey
      # @return [Array<Types::KeySchemaElement>]
      def key_schema
        data.key_schema
      end

      # The current state of the table:
      #
      # * *CREATING* - The table is being created.
      #
      # * *UPDATING* - The table is being updated.
      #
      # * *DELETING* - The table is being deleted.
      #
      # * *ACTIVE* - The table is ready for use.
      # @return [String]
      def table_status
        data.table_status
      end

      # The date and time when the table was created, in [UNIX epoch time][1]
      # format.
      #
      #
      #
      # [1]: http://www.epochconverter.com/
      # @return [Time]
      def creation_date_time
        data.creation_date_time
      end

      # The provisioned throughput settings for the table, consisting of read
      # and write capacity units, along with data about increases and
      # decreases.
      # @return [Types::ProvisionedThroughputDescription]
      def provisioned_throughput
        data.provisioned_throughput
      end

      # The total size of the specified table, in bytes. DynamoDB updates this
      # value approximately every six hours. Recent changes might not be
      # reflected in this value.
      # @return [Integer]
      def table_size_bytes
        data.table_size_bytes
      end

      # The number of items in the specified table. DynamoDB updates this
      # value approximately every six hours. Recent changes might not be
      # reflected in this value.
      # @return [Integer]
      def item_count
        data.item_count
      end

      # The Amazon Resource Name (ARN) that uniquely identifies the table.
      # @return [String]
      def table_arn
        data.table_arn
      end

      # Represents one or more local secondary indexes on the table. Each
      # index is scoped to a given partition key value. Tables with one or
      # more local secondary indexes are subject to an item collection size
      # limit, where the amount of data within a given item collection cannot
      # exceed 10 GB. Each element is composed of:
      #
      # * *IndexName* - The name of the local secondary index.
      #
      # * *KeySchema* - Specifies the complete index key schema. The attribute
      #   names in the key schema must be between 1 and 255 characters
      #   (inclusive). The key schema must begin with the same partition key
      #   as the table.
      #
      # * *Projection* - Specifies attributes that are copied (projected) from
      #   the table into the index. These are in addition to the primary key
      #   attributes and index key attributes, which are automatically
      #   projected. Each attribute specification is composed of:
      # 
      #   * *ProjectionType* - One of the following:
      # 
      #     * `KEYS_ONLY` - Only the index and primary keys are projected into
      #       the index.
      # 
      #     * `INCLUDE` - Only the specified table attributes are projected
      #       into the index. The list of projected attributes are in
      #       *NonKeyAttributes*.
      # 
      #     * `ALL` - All of the table attributes are projected into the
      #       index.
      # 
      #   * *NonKeyAttributes* - A list of one or more non-key attribute names
      #     that are projected into the secondary index. The total count of
      #     attributes provided in *NonKeyAttributes*, summed across all of
      #     the secondary indexes, must not exceed 20. If you project the same
      #     attribute into two different indexes, this counts as two distinct
      #     attributes when determining the total.
      #
      # * *IndexSizeBytes* - Represents the total size of the index, in bytes.
      #   DynamoDB updates this value approximately every six hours. Recent
      #   changes might not be reflected in this value.
      #
      # * *ItemCount* - Represents the number of items in the index. DynamoDB
      #   updates this value approximately every six hours. Recent changes
      #   might not be reflected in this value.
      #
      # If the table is in the `DELETING` state, no information about indexes
      # will be returned.
      # @return [Array<Types::LocalSecondaryIndexDescription>]
      def local_secondary_indexes
        data.local_secondary_indexes
      end

      # The global secondary indexes, if any, on the table. Each index is
      # scoped to a given partition key value. Each element is composed of:
      #
      # * *Backfilling* - If true, then the index is currently in the
      #   backfilling phase. Backfilling occurs only when a new global
      #   secondary index is added to the table; it is the process by which
      #   DynamoDB populates the new index with data from the table. (This
      #   attribute does not appear for indexes that were created during a
      #   *CreateTable* operation.)
      #
      # * *IndexName* - The name of the global secondary index.
      #
      # * *IndexSizeBytes* - The total size of the global secondary index, in
      #   bytes. DynamoDB updates this value approximately every six hours.
      #   Recent changes might not be reflected in this value.
      #
      # * *IndexStatus* - The current status of the global secondary index:
      # 
      #   * *CREATING* - The index is being created.
      # 
      #   * *UPDATING* - The index is being updated.
      # 
      #   * *DELETING* - The index is being deleted.
      # 
      #   * *ACTIVE* - The index is ready for use.
      #
      # * *ItemCount* - The number of items in the global secondary index.
      #   DynamoDB updates this value approximately every six hours. Recent
      #   changes might not be reflected in this value.
      #
      # * *KeySchema* - Specifies the complete index key schema. The attribute
      #   names in the key schema must be between 1 and 255 characters
      #   (inclusive). The key schema must begin with the same partition key
      #   as the table.
      #
      # * *Projection* - Specifies attributes that are copied (projected) from
      #   the table into the index. These are in addition to the primary key
      #   attributes and index key attributes, which are automatically
      #   projected. Each attribute specification is composed of:
      # 
      #   * *ProjectionType* - One of the following:
      # 
      #     * `KEYS_ONLY` - Only the index and primary keys are projected into
      #       the index.
      # 
      #     * `INCLUDE` - Only the specified table attributes are projected
      #       into the index. The list of projected attributes are in
      #       *NonKeyAttributes*.
      # 
      #     * `ALL` - All of the table attributes are projected into the
      #       index.
      # 
      #   * *NonKeyAttributes* - A list of one or more non-key attribute names
      #     that are projected into the secondary index. The total count of
      #     attributes provided in *NonKeyAttributes*, summed across all of
      #     the secondary indexes, must not exceed 20. If you project the same
      #     attribute into two different indexes, this counts as two distinct
      #     attributes when determining the total.
      #
      # * *ProvisionedThroughput* - The provisioned throughput settings for
      #   the global secondary index, consisting of read and write capacity
      #   units, along with data about increases and decreases.
      #
      # If the table is in the `DELETING` state, no information about indexes
      # will be returned.
      # @return [Array<Types::GlobalSecondaryIndexDescription>]
      def global_secondary_indexes
        data.global_secondary_indexes
      end

      # The current DynamoDB Streams configuration for the table.
      # @return [Types::StreamSpecification]
      def stream_specification
        data.stream_specification
      end

      # A timestamp, in ISO 8601 format, for this stream.
      #
      # Note that *LatestStreamLabel* is not a unique identifier for the
      # stream, because it is possible that a stream from another table might
      # have the same timestamp. However, the combination of the following
      # three elements is guaranteed to be unique:
      #
      # * the AWS customer ID.
      #
      # * the table name.
      #
      # * the *StreamLabel*.
      # @return [String]
      def latest_stream_label
        data.latest_stream_label
      end

      # The Amazon Resource Name (ARN) that uniquely identifies the latest
      # stream for this table.
      # @return [String]
      def latest_stream_arn
        data.latest_stream_arn
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {Table}.
      # Returns `self` making it possible to chain methods.
      #
      #     table.reload.data
      #
      # @return [self]
      def load
        resp = @client.describe_table(table_name: @name)
        @data = resp.table
        self
      end
      alias :reload :load

      # @return [Types::TableDescription]
      #   Returns the data for this {Table}. Calls
      #   {Client#describe_table} if {#data_loaded?} is `false`.
      def data
        load unless @data
        @data
      end

      # @return [Boolean]
      #   Returns `true` if this resource is loaded.  Accessing attributes or
      #   {#data} on an unloaded resource will trigger a call to {#load}.
      def data_loaded?
        !!@data
      end

      # @!group Actions

      # @example Request syntax with placeholder values
      #
      #   table.delete()
      # @param [Hash] options ({})
      # @return [Types::DeleteTableOutput]
      def delete(options = {})
        options = options.merge(table_name: @name)
        resp = @client.delete_table(options)
        resp.data
      end

      # @example Request syntax with placeholder values
      #
      #   table.delete_item({
      #     key: { # required
      #       "AttributeName" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #     expected: {
      #       "AttributeName" => {
      #         value: "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #         exists: false,
      #         comparison_operator: "EQ", # accepts EQ, NE, IN, LE, LT, GE, GT, BETWEEN, NOT_NULL, NULL, CONTAINS, NOT_CONTAINS, BEGINS_WITH
      #         attribute_value_list: ["value"], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #       },
      #     },
      #     conditional_operator: "AND", # accepts AND, OR
      #     return_values: "NONE", # accepts NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW
      #     return_consumed_capacity: "INDEXES", # accepts INDEXES, TOTAL, NONE
      #     return_item_collection_metrics: "SIZE", # accepts SIZE, NONE
      #     condition_expression: "ConditionExpression",
      #     expression_attribute_names: {
      #       "ExpressionAttributeNameVariable" => "AttributeName",
      #     },
      #     expression_attribute_values: {
      #       "ExpressionAttributeValueVariable" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #   })
      # @param [Hash] options ({})
      # @option options [required, Hash<String,Types::AttributeValue>] :key
      #   A map of attribute names to *AttributeValue* objects, representing the
      #   primary key of the item to delete.
      #
      #   For the primary key, you must provide all of the attributes. For
      #   example, with a simple primary key, you only need to provide a value
      #   for the partition key. For a composite primary key, you must provide
      #   values for both the partition key and the sort key.
      # @option options [Hash<String,Types::ExpectedAttributeValue>] :expected
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *ConditionExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #   A map of attribute/condition pairs. *Expected* provides a conditional
      #   block for the *DeleteItem* operation.
      #
      #   Each element of *Expected* consists of an attribute name, a comparison
      #   operator, and one or more values. DynamoDB compares the attribute with
      #   the value(s) you supplied, using the comparison operator. For each
      #   *Expected* element, the result of the evaluation is either true or
      #   false.
      #
      #   If you specify more than one element in the *Expected* map, then by
      #   default all of the conditions must evaluate to true. In other words,
      #   the conditions are ANDed together. (You can use the
      #   *ConditionalOperator* parameter to OR the conditions instead. If you
      #   do this, then at least one of the conditions must evaluate to true,
      #   rather than all of them.)
      #
      #   If the *Expected* map evaluates to true, then the conditional
      #   operation succeeds; otherwise, it fails.
      #
      #   *Expected* contains the following:
      #
      #   * *AttributeValueList* - One or more values to evaluate against the
      #     supplied attribute. The number of values in the list depends on the
      #     *ComparisonOperator* being used.
      #
      #     For type Number, value comparisons are numeric.
      #
      #     String value comparisons for greater than, equals, or less than are
      #     based on ASCII character code values. For example, `a` is greater
      #     than `A`, and `a` is greater than `B`. For a list of code values,
      #     see
      #     [http://en.wikipedia.org/wiki/ASCII#ASCII\_printable\_characters][1].
      #
      #     For type Binary, DynamoDB treats each byte of the binary data as
      #     unsigned when it compares binary values.
      #
      #   * *ComparisonOperator* - A comparator for evaluating attributes in the
      #     *AttributeValueList*. When performing the comparison, DynamoDB uses
      #     strongly consistent reads.
      #
      #     The following comparison operators are available:
      #
      #     `EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
      #     NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN`
      #
      #     The following are descriptions of each comparison operator.
      #
      #     * `EQ`\: Equal. `EQ` is supported for all datatypes, including lists
      #       and maps.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, Binary, String Set, Number Set, or Binary
      #       Set. If an item contains an *AttributeValue* element of a
      #       different type than the one provided in the request, the value
      #       does not match. For example, `\{"S":"6"\}` does not equal
      #       `\{"N":"6"\}`. Also, `\{"N":"6"\}` does not equal `\{"NS":["6",
      #       "2", "1"]\}`.
      #
      #
      #
      #     * `NE`\: Not equal. `NE` is supported for all datatypes, including
      #       lists and maps.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String, Number, Binary, String Set, Number Set, or Binary Set. If
      #       an item contains an *AttributeValue* of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not equal `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `LE`\: Less than or equal.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `LT`\: Less than.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String, Number, or Binary (not a set type). If an item contains an
      #       *AttributeValue* element of a different type than the one provided
      #       in the request, the value does not match. For example,
      #       `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also, `\{"N":"6"\}`
      #       does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `GE`\: Greater than or equal.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `GT`\: Greater than.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `NOT_NULL`\: The attribute exists. `NOT_NULL` is supported for all
      #       datatypes, including lists and maps.
      #
      #       <note markdown="1"> This operator tests for the existence of an attribute, not its
      #       data type. If the data type of attribute "`a`" is null, and you
      #       evaluate it using `NOT_NULL`, the result is a Boolean *true*. This
      #       result is because the attribute "`a`" exists; its data type is
      #       not relevant to the `NOT_NULL` comparison operator.
      #
      #        </note>
      #
      #     * `NULL`\: The attribute does not exist. `NULL` is supported for all
      #       datatypes, including lists and maps.
      #
      #       <note markdown="1"> This operator tests for the nonexistence of an attribute, not its
      #       data type. If the data type of attribute "`a`" is null, and you
      #       evaluate it using `NULL`, the result is a Boolean *false*. This is
      #       because the attribute "`a`" exists; its data type is not
      #       relevant to the `NULL` comparison operator.
      #
      #        </note>
      #
      #     * `CONTAINS`\: Checks for a subsequence, or value in a set.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If the target
      #       attribute of the comparison is of type String, then the operator
      #       checks for a substring match. If the target attribute of the
      #       comparison is of type Binary, then the operator looks for a
      #       subsequence of the target that matches the input. If the target
      #       attribute of the comparison is a set ("`SS`", "`NS`", or
      #       "`BS`"), then the operator evaluates to true if it finds an
      #       exact match with any member of the set.
      #
      #       CONTAINS is supported for lists: When evaluating "`a CONTAINS
      #       b`", "`a`" can be a list; however, "`b`" cannot be a set, a
      #       map, or a list.
      #
      #     * `NOT_CONTAINS`\: Checks for absence of a subsequence, or absence
      #       of a value in a set.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If the target
      #       attribute of the comparison is a String, then the operator checks
      #       for the absence of a substring match. If the target attribute of
      #       the comparison is Binary, then the operator checks for the absence
      #       of a subsequence of the target that matches the input. If the
      #       target attribute of the comparison is a set ("`SS`", "`NS`",
      #       or "`BS`"), then the operator evaluates to true if it *does not*
      #       find an exact match with any member of the set.
      #
      #       NOT\_CONTAINS is supported for lists: When evaluating "`a NOT
      #       CONTAINS b`", "`a`" can be a list; however, "`b`" cannot be a
      #       set, a map, or a list.
      #
      #     * `BEGINS_WITH`\: Checks for a prefix.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String or Binary (not a Number or a set type). The target
      #       attribute of the comparison must be of type String or Binary (not
      #       a Number or a set type).
      #
      #
      #
      #     * `IN`\: Checks for matching elements within two sets.
      #
      #       *AttributeValueList* can contain one or more *AttributeValue*
      #       elements of type String, Number, or Binary (not a set type). These
      #       attributes are compared against an existing set type attribute of
      #       an item. If any elements of the input set are present in the item
      #       attribute, the expression evaluates to true.
      #
      #     * `BETWEEN`\: Greater than or equal to the first value, and less
      #       than or equal to the second value.
      #
      #       *AttributeValueList* must contain two *AttributeValue* elements of
      #       the same type, either String, Number, or Binary (not a set type).
      #       A target attribute matches if the target value is greater than, or
      #       equal to, the first element and less than, or equal to, the second
      #       element. If an item contains an *AttributeValue* element of a
      #       different type than the one provided in the request, the value
      #       does not match. For example, `\{"S":"6"\}` does not compare to
      #       `\{"N":"6"\}`. Also, `\{"N":"6"\}` does not compare to
      #       `\{"NS":["6", "2", "1"]\}`
      #
      #   For usage examples of *AttributeValueList* and *ComparisonOperator*,
      #   see [Legacy Conditional Parameters][2] in the *Amazon DynamoDB
      #   Developer Guide*.
      #
      #   For backward compatibility with previous DynamoDB releases, the
      #   following parameters can be used instead of *AttributeValueList* and
      #   *ComparisonOperator*\:
      #
      #   * *Value* - A value for DynamoDB to compare with an attribute.
      #
      #   * *Exists* - A Boolean value that causes DynamoDB to evaluate the
      #     value before attempting the conditional operation:
      #
      #     * If *Exists* is `true`, DynamoDB will check to see if that
      #       attribute value already exists in the table. If it is found, then
      #       the condition evaluates to true; otherwise the condition evaluate
      #       to false.
      #
      #     * If *Exists* is `false`, DynamoDB assumes that the attribute value
      #       does *not* exist in the table. If in fact the value does not
      #       exist, then the assumption is valid and the condition evaluates to
      #       true. If the value is found, despite the assumption that it does
      #       not exist, the condition evaluates to false.
      #
      #     Note that the default value for *Exists* is `true`.
      #
      #   The *Value* and *Exists* parameters are incompatible with
      #   *AttributeValueList* and *ComparisonOperator*. Note that if you use
      #   both sets of parameters at once, DynamoDB will return a
      #   *ValidationException* exception.
      #
      #   <note markdown="1"> This parameter does not support attributes of type List or Map.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html
      # @option options [String] :conditional_operator
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *ConditionExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #   A logical operator to apply to the conditions in the *Expected* map:
      #
      #   * `AND` - If all of the conditions evaluate to true, then the entire
      #     map evaluates to true.
      #
      #   * `OR` - If at least one of the conditions evaluate to true, then the
      #     entire map evaluates to true.
      #
      #   If you omit *ConditionalOperator*, then `AND` is the default.
      #
      #   The operation will succeed only if the entire map evaluates to true.
      #
      #   <note markdown="1"> This parameter does not support attributes of type List or Map.
      #
      #    </note>
      # @option options [String] :return_values
      #   Use *ReturnValues* if you want to get the item attributes as they
      #   appeared before they were deleted. For *DeleteItem*, the valid values
      #   are:
      #
      #   * `NONE` - If *ReturnValues* is not specified, or if its value is
      #     `NONE`, then nothing is returned. (This setting is the default for
      #     *ReturnValues*.)
      #
      #   * `ALL_OLD` - The content of the old item is returned.
      #
      #   <note markdown="1"> The *ReturnValues* parameter is used by several DynamoDB operations;
      #   however, *DeleteItem* does not recognize any values other than `NONE`
      #   or `ALL_OLD`.
      #
      #    </note>
      # @option options [String] :return_consumed_capacity
      #   Determines the level of detail about provisioned throughput
      #   consumption that is returned in the response:
      #
      #   * *INDEXES* - The response includes the aggregate *ConsumedCapacity*
      #     for the operation, together with *ConsumedCapacity* for each table
      #     and secondary index that was accessed.
      #
      #     Note that some operations, such as *GetItem* and *BatchGetItem*, do
      #     not access any indexes at all. In these cases, specifying *INDEXES*
      #     will only return *ConsumedCapacity* information for table(s).
      #
      #   * *TOTAL* - The response includes only the aggregate
      #     *ConsumedCapacity* for the operation.
      #
      #   * *NONE* - No *ConsumedCapacity* details are included in the response.
      # @option options [String] :return_item_collection_metrics
      #   Determines whether item collection metrics are returned. If set to
      #   `SIZE`, the response includes statistics about item collections, if
      #   any, that were modified during the operation are returned in the
      #   response. If set to `NONE` (the default), no statistics are returned.
      # @option options [String] :condition_expression
      #   A condition that must be satisfied in order for a conditional
      #   *DeleteItem* to succeed.
      #
      #   An expression can contain any of the following:
      #
      #   * Functions: `attribute_exists | attribute_not_exists | attribute_type
      #     | contains | begins_with | size`
      #
      #     These function names are case-sensitive.
      #
      #   * Comparison operators: ` = | &#x3C;&#x3E; | &#x3C; | &#x3E; | &#x3C;=
      #     | &#x3E;= | BETWEEN | IN`
      #
      #   * Logical operators: `AND | OR | NOT`
      #
      #   For more information on condition expressions, see [Specifying
      #   Conditions][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *ConditionExpression* replaces the legacy *ConditionalOperator* and
      #   *Expected* parameters.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html
      # @option options [Hash<String,String>] :expression_attribute_names
      #   One or more substitution tokens for attribute names in an expression.
      #   The following are some use cases for using
      #   *ExpressionAttributeNames*\:
      #
      #   * To access an attribute whose name conflicts with a DynamoDB reserved
      #     word.
      #
      #   * To create a placeholder for repeating occurrences of an attribute
      #     name in an expression.
      #
      #   * To prevent special characters in an attribute name from being
      #     misinterpreted in an expression.
      #
      #   Use the **#** character in an expression to dereference an attribute
      #   name. For example, consider the following attribute name:
      #
      #   * `Percentile`
      #
      #   ^
      #
      #   The name of this attribute conflicts with a reserved word, so it
      #   cannot be used directly in an expression. (For the complete list of
      #   reserved words, see [Reserved Words][1] in the *Amazon DynamoDB
      #   Developer Guide*). To work around this, you could specify the
      #   following for *ExpressionAttributeNames*\:
      #
      #   * `\{"#P":"Percentile"\}`
      #
      #   ^
      #
      #   You could then use this substitution in an expression, as in this
      #   example:
      #
      #   * `#P = :val`
      #
      #   ^
      #
      #   <note markdown="1"> Tokens that begin with the **\:** character are *expression attribute
      #   values*, which are placeholders for the actual value at runtime.
      #
      #    </note>
      #
      #   For more information on expression attribute names, see [Accessing
      #   Item Attributes][2] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html
      # @option options [Hash<String,Types::AttributeValue>] :expression_attribute_values
      #   One or more values that can be substituted in an expression.
      #
      #   Use the **\:** (colon) character in an expression to dereference an
      #   attribute value. For example, suppose that you wanted to check whether
      #   the value of the *ProductStatus* attribute was one of the following:
      #
      #   `Available | Backordered | Discontinued`
      #
      #   You would first need to specify *ExpressionAttributeValues* as
      #   follows:
      #
      #   `\{ ":avail":\{"S":"Available"\}, ":back":\{"S":"Backordered"\},
      #   ":disc":\{"S":"Discontinued"\} \}`
      #
      #   You could then use these values in an expression, such as this:
      #
      #   `ProductStatus IN (:avail, :back, :disc)`
      #
      #   For more information on expression attribute values, see [Specifying
      #   Conditions][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html
      # @return [Types::DeleteItemOutput]
      def delete_item(options = {})
        options = options.merge(table_name: @name)
        resp = @client.delete_item(options)
        resp.data
      end

      # @example Request syntax with placeholder values
      #
      #   table.get_item({
      #     key: { # required
      #       "AttributeName" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #     attributes_to_get: ["AttributeName"],
      #     consistent_read: false,
      #     return_consumed_capacity: "INDEXES", # accepts INDEXES, TOTAL, NONE
      #     projection_expression: "ProjectionExpression",
      #     expression_attribute_names: {
      #       "ExpressionAttributeNameVariable" => "AttributeName",
      #     },
      #   })
      # @param [Hash] options ({})
      # @option options [required, Hash<String,Types::AttributeValue>] :key
      #   A map of attribute names to *AttributeValue* objects, representing the
      #   primary key of the item to retrieve.
      #
      #   For the primary key, you must provide all of the attributes. For
      #   example, with a simple primary key, you only need to provide a value
      #   for the partition key. For a composite primary key, you must provide
      #   values for both the partition key and the sort key.
      # @option options [Array<String>] :attributes_to_get
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *ProjectionExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #    This parameter allows you to retrieve attributes of type List or Map;
      #   however, it cannot retrieve individual elements within a List or a
      #   Map.
      #
      #   The names of one or more attributes to retrieve. If no attribute names
      #   are provided, then all attributes will be returned. If any of the
      #   requested attributes are not found, they will not appear in the
      #   result.
      #
      #   Note that *AttributesToGet* has no effect on provisioned throughput
      #   consumption. DynamoDB determines capacity units consumed based on item
      #   size, not on the amount of data that is returned to an application.
      # @option options [Boolean] :consistent_read
      #   Determines the read consistency model: If set to `true`, then the
      #   operation uses strongly consistent reads; otherwise, the operation
      #   uses eventually consistent reads.
      # @option options [String] :return_consumed_capacity
      #   Determines the level of detail about provisioned throughput
      #   consumption that is returned in the response:
      #
      #   * *INDEXES* - The response includes the aggregate *ConsumedCapacity*
      #     for the operation, together with *ConsumedCapacity* for each table
      #     and secondary index that was accessed.
      #
      #     Note that some operations, such as *GetItem* and *BatchGetItem*, do
      #     not access any indexes at all. In these cases, specifying *INDEXES*
      #     will only return *ConsumedCapacity* information for table(s).
      #
      #   * *TOTAL* - The response includes only the aggregate
      #     *ConsumedCapacity* for the operation.
      #
      #   * *NONE* - No *ConsumedCapacity* details are included in the response.
      # @option options [String] :projection_expression
      #   A string that identifies one or more attributes to retrieve from the
      #   table. These attributes can include scalars, sets, or elements of a
      #   JSON document. The attributes in the expression must be separated by
      #   commas.
      #
      #   If no attribute names are specified, then all attributes will be
      #   returned. If any of the requested attributes are not found, they will
      #   not appear in the result.
      #
      #   For more information, see [Accessing Item Attributes][1] in the
      #   *Amazon DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *ProjectionExpression* replaces the legacy *AttributesToGet*
      #   parameter.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html
      # @option options [Hash<String,String>] :expression_attribute_names
      #   One or more substitution tokens for attribute names in an expression.
      #   The following are some use cases for using
      #   *ExpressionAttributeNames*\:
      #
      #   * To access an attribute whose name conflicts with a DynamoDB reserved
      #     word.
      #
      #   * To create a placeholder for repeating occurrences of an attribute
      #     name in an expression.
      #
      #   * To prevent special characters in an attribute name from being
      #     misinterpreted in an expression.
      #
      #   Use the **#** character in an expression to dereference an attribute
      #   name. For example, consider the following attribute name:
      #
      #   * `Percentile`
      #
      #   ^
      #
      #   The name of this attribute conflicts with a reserved word, so it
      #   cannot be used directly in an expression. (For the complete list of
      #   reserved words, see [Reserved Words][1] in the *Amazon DynamoDB
      #   Developer Guide*). To work around this, you could specify the
      #   following for *ExpressionAttributeNames*\:
      #
      #   * `\{"#P":"Percentile"\}`
      #
      #   ^
      #
      #   You could then use this substitution in an expression, as in this
      #   example:
      #
      #   * `#P = :val`
      #
      #   ^
      #
      #   <note markdown="1"> Tokens that begin with the **\:** character are *expression attribute
      #   values*, which are placeholders for the actual value at runtime.
      #
      #    </note>
      #
      #   For more information on expression attribute names, see [Accessing
      #   Item Attributes][2] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html
      # @return [Types::GetItemOutput]
      def get_item(options = {})
        options = options.merge(table_name: @name)
        resp = @client.get_item(options)
        resp.data
      end

      # @example Request syntax with placeholder values
      #
      #   table.put_item({
      #     item: { # required
      #       "AttributeName" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #     expected: {
      #       "AttributeName" => {
      #         value: "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #         exists: false,
      #         comparison_operator: "EQ", # accepts EQ, NE, IN, LE, LT, GE, GT, BETWEEN, NOT_NULL, NULL, CONTAINS, NOT_CONTAINS, BEGINS_WITH
      #         attribute_value_list: ["value"], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #       },
      #     },
      #     return_values: "NONE", # accepts NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW
      #     return_consumed_capacity: "INDEXES", # accepts INDEXES, TOTAL, NONE
      #     return_item_collection_metrics: "SIZE", # accepts SIZE, NONE
      #     conditional_operator: "AND", # accepts AND, OR
      #     condition_expression: "ConditionExpression",
      #     expression_attribute_names: {
      #       "ExpressionAttributeNameVariable" => "AttributeName",
      #     },
      #     expression_attribute_values: {
      #       "ExpressionAttributeValueVariable" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #   })
      # @param [Hash] options ({})
      # @option options [required, Hash<String,Types::AttributeValue>] :item
      #   A map of attribute name/value pairs, one for each attribute. Only the
      #   primary key attributes are required; you can optionally provide other
      #   attribute name-value pairs for the item.
      #
      #   You must provide all of the attributes for the primary key. For
      #   example, with a simple primary key, you only need to provide a value
      #   for the partition key. For a composite primary key, you must provide
      #   both values for both the partition key and the sort key.
      #
      #   If you specify any attributes that are part of an index key, then the
      #   data types for those attributes must match those of the schema in the
      #   table's attribute definition.
      #
      #   For more information about primary keys, see [Primary Key][1] in the
      #   *Amazon DynamoDB Developer Guide*.
      #
      #   Each element in the *Item* map is an *AttributeValue* object.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey
      # @option options [Hash<String,Types::ExpectedAttributeValue>] :expected
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *ConditionExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #   A map of attribute/condition pairs. *Expected* provides a conditional
      #   block for the *PutItem* operation.
      #
      #   <note markdown="1"> This parameter does not support attributes of type List or Map.
      #
      #    </note>
      #
      #   Each element of *Expected* consists of an attribute name, a comparison
      #   operator, and one or more values. DynamoDB compares the attribute with
      #   the value(s) you supplied, using the comparison operator. For each
      #   *Expected* element, the result of the evaluation is either true or
      #   false.
      #
      #   If you specify more than one element in the *Expected* map, then by
      #   default all of the conditions must evaluate to true. In other words,
      #   the conditions are ANDed together. (You can use the
      #   *ConditionalOperator* parameter to OR the conditions instead. If you
      #   do this, then at least one of the conditions must evaluate to true,
      #   rather than all of them.)
      #
      #   If the *Expected* map evaluates to true, then the conditional
      #   operation succeeds; otherwise, it fails.
      #
      #   *Expected* contains the following:
      #
      #   * *AttributeValueList* - One or more values to evaluate against the
      #     supplied attribute. The number of values in the list depends on the
      #     *ComparisonOperator* being used.
      #
      #     For type Number, value comparisons are numeric.
      #
      #     String value comparisons for greater than, equals, or less than are
      #     based on ASCII character code values. For example, `a` is greater
      #     than `A`, and `a` is greater than `B`. For a list of code values,
      #     see
      #     [http://en.wikipedia.org/wiki/ASCII#ASCII\_printable\_characters][1].
      #
      #     For type Binary, DynamoDB treats each byte of the binary data as
      #     unsigned when it compares binary values.
      #
      #   * *ComparisonOperator* - A comparator for evaluating attributes in the
      #     *AttributeValueList*. When performing the comparison, DynamoDB uses
      #     strongly consistent reads.
      #
      #     The following comparison operators are available:
      #
      #     `EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
      #     NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN`
      #
      #     The following are descriptions of each comparison operator.
      #
      #     * `EQ`\: Equal. `EQ` is supported for all datatypes, including lists
      #       and maps.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, Binary, String Set, Number Set, or Binary
      #       Set. If an item contains an *AttributeValue* element of a
      #       different type than the one provided in the request, the value
      #       does not match. For example, `\{"S":"6"\}` does not equal
      #       `\{"N":"6"\}`. Also, `\{"N":"6"\}` does not equal `\{"NS":["6",
      #       "2", "1"]\}`.
      #
      #
      #
      #     * `NE`\: Not equal. `NE` is supported for all datatypes, including
      #       lists and maps.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String, Number, Binary, String Set, Number Set, or Binary Set. If
      #       an item contains an *AttributeValue* of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not equal `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `LE`\: Less than or equal.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `LT`\: Less than.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String, Number, or Binary (not a set type). If an item contains an
      #       *AttributeValue* element of a different type than the one provided
      #       in the request, the value does not match. For example,
      #       `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also, `\{"N":"6"\}`
      #       does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `GE`\: Greater than or equal.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `GT`\: Greater than.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `NOT_NULL`\: The attribute exists. `NOT_NULL` is supported for all
      #       datatypes, including lists and maps.
      #
      #       <note markdown="1"> This operator tests for the existence of an attribute, not its
      #       data type. If the data type of attribute "`a`" is null, and you
      #       evaluate it using `NOT_NULL`, the result is a Boolean *true*. This
      #       result is because the attribute "`a`" exists; its data type is
      #       not relevant to the `NOT_NULL` comparison operator.
      #
      #        </note>
      #
      #     * `NULL`\: The attribute does not exist. `NULL` is supported for all
      #       datatypes, including lists and maps.
      #
      #       <note markdown="1"> This operator tests for the nonexistence of an attribute, not its
      #       data type. If the data type of attribute "`a`" is null, and you
      #       evaluate it using `NULL`, the result is a Boolean *false*. This is
      #       because the attribute "`a`" exists; its data type is not
      #       relevant to the `NULL` comparison operator.
      #
      #        </note>
      #
      #     * `CONTAINS`\: Checks for a subsequence, or value in a set.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If the target
      #       attribute of the comparison is of type String, then the operator
      #       checks for a substring match. If the target attribute of the
      #       comparison is of type Binary, then the operator looks for a
      #       subsequence of the target that matches the input. If the target
      #       attribute of the comparison is a set ("`SS`", "`NS`", or
      #       "`BS`"), then the operator evaluates to true if it finds an
      #       exact match with any member of the set.
      #
      #       CONTAINS is supported for lists: When evaluating "`a CONTAINS
      #       b`", "`a`" can be a list; however, "`b`" cannot be a set, a
      #       map, or a list.
      #
      #     * `NOT_CONTAINS`\: Checks for absence of a subsequence, or absence
      #       of a value in a set.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If the target
      #       attribute of the comparison is a String, then the operator checks
      #       for the absence of a substring match. If the target attribute of
      #       the comparison is Binary, then the operator checks for the absence
      #       of a subsequence of the target that matches the input. If the
      #       target attribute of the comparison is a set ("`SS`", "`NS`",
      #       or "`BS`"), then the operator evaluates to true if it *does not*
      #       find an exact match with any member of the set.
      #
      #       NOT\_CONTAINS is supported for lists: When evaluating "`a NOT
      #       CONTAINS b`", "`a`" can be a list; however, "`b`" cannot be a
      #       set, a map, or a list.
      #
      #     * `BEGINS_WITH`\: Checks for a prefix.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String or Binary (not a Number or a set type). The target
      #       attribute of the comparison must be of type String or Binary (not
      #       a Number or a set type).
      #
      #
      #
      #     * `IN`\: Checks for matching elements within two sets.
      #
      #       *AttributeValueList* can contain one or more *AttributeValue*
      #       elements of type String, Number, or Binary (not a set type). These
      #       attributes are compared against an existing set type attribute of
      #       an item. If any elements of the input set are present in the item
      #       attribute, the expression evaluates to true.
      #
      #     * `BETWEEN`\: Greater than or equal to the first value, and less
      #       than or equal to the second value.
      #
      #       *AttributeValueList* must contain two *AttributeValue* elements of
      #       the same type, either String, Number, or Binary (not a set type).
      #       A target attribute matches if the target value is greater than, or
      #       equal to, the first element and less than, or equal to, the second
      #       element. If an item contains an *AttributeValue* element of a
      #       different type than the one provided in the request, the value
      #       does not match. For example, `\{"S":"6"\}` does not compare to
      #       `\{"N":"6"\}`. Also, `\{"N":"6"\}` does not compare to
      #       `\{"NS":["6", "2", "1"]\}`
      #
      #   For usage examples of *AttributeValueList* and *ComparisonOperator*,
      #   see [Legacy Conditional Parameters][2] in the *Amazon DynamoDB
      #   Developer Guide*.
      #
      #   For backward compatibility with previous DynamoDB releases, the
      #   following parameters can be used instead of *AttributeValueList* and
      #   *ComparisonOperator*\:
      #
      #   * *Value* - A value for DynamoDB to compare with an attribute.
      #
      #   * *Exists* - A Boolean value that causes DynamoDB to evaluate the
      #     value before attempting the conditional operation:
      #
      #     * If *Exists* is `true`, DynamoDB will check to see if that
      #       attribute value already exists in the table. If it is found, then
      #       the condition evaluates to true; otherwise the condition evaluate
      #       to false.
      #
      #     * If *Exists* is `false`, DynamoDB assumes that the attribute value
      #       does *not* exist in the table. If in fact the value does not
      #       exist, then the assumption is valid and the condition evaluates to
      #       true. If the value is found, despite the assumption that it does
      #       not exist, the condition evaluates to false.
      #
      #     Note that the default value for *Exists* is `true`.
      #
      #   The *Value* and *Exists* parameters are incompatible with
      #   *AttributeValueList* and *ComparisonOperator*. Note that if you use
      #   both sets of parameters at once, DynamoDB will return a
      #   *ValidationException* exception.
      #
      #
      #
      #   [1]: http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html
      # @option options [String] :return_values
      #   Use *ReturnValues* if you want to get the item attributes as they
      #   appeared before they were updated with the *PutItem* request. For
      #   *PutItem*, the valid values are:
      #
      #   * `NONE` - If *ReturnValues* is not specified, or if its value is
      #     `NONE`, then nothing is returned. (This setting is the default for
      #     *ReturnValues*.)
      #
      #   * `ALL_OLD` - If *PutItem* overwrote an attribute name-value pair,
      #     then the content of the old item is returned.
      #
      #   <note markdown="1"> The *ReturnValues* parameter is used by several DynamoDB operations;
      #   however, *PutItem* does not recognize any values other than `NONE` or
      #   `ALL_OLD`.
      #
      #    </note>
      # @option options [String] :return_consumed_capacity
      #   Determines the level of detail about provisioned throughput
      #   consumption that is returned in the response:
      #
      #   * *INDEXES* - The response includes the aggregate *ConsumedCapacity*
      #     for the operation, together with *ConsumedCapacity* for each table
      #     and secondary index that was accessed.
      #
      #     Note that some operations, such as *GetItem* and *BatchGetItem*, do
      #     not access any indexes at all. In these cases, specifying *INDEXES*
      #     will only return *ConsumedCapacity* information for table(s).
      #
      #   * *TOTAL* - The response includes only the aggregate
      #     *ConsumedCapacity* for the operation.
      #
      #   * *NONE* - No *ConsumedCapacity* details are included in the response.
      # @option options [String] :return_item_collection_metrics
      #   Determines whether item collection metrics are returned. If set to
      #   `SIZE`, the response includes statistics about item collections, if
      #   any, that were modified during the operation are returned in the
      #   response. If set to `NONE` (the default), no statistics are returned.
      # @option options [String] :conditional_operator
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *ConditionExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #   A logical operator to apply to the conditions in the *Expected* map:
      #
      #   * `AND` - If all of the conditions evaluate to true, then the entire
      #     map evaluates to true.
      #
      #   * `OR` - If at least one of the conditions evaluate to true, then the
      #     entire map evaluates to true.
      #
      #   If you omit *ConditionalOperator*, then `AND` is the default.
      #
      #   The operation will succeed only if the entire map evaluates to true.
      #
      #   <note markdown="1"> This parameter does not support attributes of type List or Map.
      #
      #    </note>
      # @option options [String] :condition_expression
      #   A condition that must be satisfied in order for a conditional
      #   *PutItem* operation to succeed.
      #
      #   An expression can contain any of the following:
      #
      #   * Functions: `attribute_exists | attribute_not_exists | attribute_type
      #     | contains | begins_with | size`
      #
      #     These function names are case-sensitive.
      #
      #   * Comparison operators: ` = | &#x3C;&#x3E; | &#x3C; | &#x3E; | &#x3C;=
      #     | &#x3E;= | BETWEEN | IN`
      #
      #   * Logical operators: `AND | OR | NOT`
      #
      #   For more information on condition expressions, see [Specifying
      #   Conditions][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *ConditionExpression* replaces the legacy *ConditionalOperator* and
      #   *Expected* parameters.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html
      # @option options [Hash<String,String>] :expression_attribute_names
      #   One or more substitution tokens for attribute names in an expression.
      #   The following are some use cases for using
      #   *ExpressionAttributeNames*\:
      #
      #   * To access an attribute whose name conflicts with a DynamoDB reserved
      #     word.
      #
      #   * To create a placeholder for repeating occurrences of an attribute
      #     name in an expression.
      #
      #   * To prevent special characters in an attribute name from being
      #     misinterpreted in an expression.
      #
      #   Use the **#** character in an expression to dereference an attribute
      #   name. For example, consider the following attribute name:
      #
      #   * `Percentile`
      #
      #   ^
      #
      #   The name of this attribute conflicts with a reserved word, so it
      #   cannot be used directly in an expression. (For the complete list of
      #   reserved words, see [Reserved Words][1] in the *Amazon DynamoDB
      #   Developer Guide*). To work around this, you could specify the
      #   following for *ExpressionAttributeNames*\:
      #
      #   * `\{"#P":"Percentile"\}`
      #
      #   ^
      #
      #   You could then use this substitution in an expression, as in this
      #   example:
      #
      #   * `#P = :val`
      #
      #   ^
      #
      #   <note markdown="1"> Tokens that begin with the **\:** character are *expression attribute
      #   values*, which are placeholders for the actual value at runtime.
      #
      #    </note>
      #
      #   For more information on expression attribute names, see [Accessing
      #   Item Attributes][2] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html
      # @option options [Hash<String,Types::AttributeValue>] :expression_attribute_values
      #   One or more values that can be substituted in an expression.
      #
      #   Use the **\:** (colon) character in an expression to dereference an
      #   attribute value. For example, suppose that you wanted to check whether
      #   the value of the *ProductStatus* attribute was one of the following:
      #
      #   `Available | Backordered | Discontinued`
      #
      #   You would first need to specify *ExpressionAttributeValues* as
      #   follows:
      #
      #   `\{ ":avail":\{"S":"Available"\}, ":back":\{"S":"Backordered"\},
      #   ":disc":\{"S":"Discontinued"\} \}`
      #
      #   You could then use these values in an expression, such as this:
      #
      #   `ProductStatus IN (:avail, :back, :disc)`
      #
      #   For more information on expression attribute values, see [Specifying
      #   Conditions][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html
      # @return [Types::PutItemOutput]
      def put_item(options = {})
        options = options.merge(table_name: @name)
        resp = @client.put_item(options)
        resp.data
      end

      # @example Request syntax with placeholder values
      #
      #   table.query({
      #     index_name: "IndexName",
      #     select: "ALL_ATTRIBUTES", # accepts ALL_ATTRIBUTES, ALL_PROJECTED_ATTRIBUTES, SPECIFIC_ATTRIBUTES, COUNT
      #     attributes_to_get: ["AttributeName"],
      #     limit: 1,
      #     consistent_read: false,
      #     key_conditions: {
      #       "AttributeName" => {
      #         attribute_value_list: ["value"], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #         comparison_operator: "EQ", # required, accepts EQ, NE, IN, LE, LT, GE, GT, BETWEEN, NOT_NULL, NULL, CONTAINS, NOT_CONTAINS, BEGINS_WITH
      #       },
      #     },
      #     query_filter: {
      #       "AttributeName" => {
      #         attribute_value_list: ["value"], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #         comparison_operator: "EQ", # required, accepts EQ, NE, IN, LE, LT, GE, GT, BETWEEN, NOT_NULL, NULL, CONTAINS, NOT_CONTAINS, BEGINS_WITH
      #       },
      #     },
      #     conditional_operator: "AND", # accepts AND, OR
      #     scan_index_forward: false,
      #     exclusive_start_key: {
      #       "AttributeName" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #     return_consumed_capacity: "INDEXES", # accepts INDEXES, TOTAL, NONE
      #     projection_expression: "ProjectionExpression",
      #     filter_expression: "ConditionExpression",
      #     key_condition_expression: "KeyExpression",
      #     expression_attribute_names: {
      #       "ExpressionAttributeNameVariable" => "AttributeName",
      #     },
      #     expression_attribute_values: {
      #       "ExpressionAttributeValueVariable" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #   })
      # @param [Hash] options ({})
      # @option options [String] :index_name
      #   The name of an index to query. This index can be any local secondary
      #   index or global secondary index on the table. Note that if you use the
      #   *IndexName* parameter, you must also provide *TableName.*
      # @option options [String] :select
      #   The attributes to be returned in the result. You can retrieve all item
      #   attributes, specific item attributes, the count of matching items, or
      #   in the case of an index, some or all of the attributes projected into
      #   the index.
      #
      #   * `ALL_ATTRIBUTES` - Returns all of the item attributes from the
      #     specified table or index. If you query a local secondary index, then
      #     for each matching item in the index DynamoDB will fetch the entire
      #     item from the parent table. If the index is configured to project
      #     all item attributes, then all of the data can be obtained from the
      #     local secondary index, and no fetching is required.
      #
      #   * `ALL_PROJECTED_ATTRIBUTES` - Allowed only when querying an index.
      #     Retrieves all attributes that have been projected into the index. If
      #     the index is configured to project all attributes, this return value
      #     is equivalent to specifying `ALL_ATTRIBUTES`.
      #
      #   * `COUNT` - Returns the number of matching items, rather than the
      #     matching items themselves.
      #
      #   * `SPECIFIC_ATTRIBUTES` - Returns only the attributes listed in
      #     *AttributesToGet*. This return value is equivalent to specifying
      #     *AttributesToGet* without specifying any value for *Select*.
      #
      #     If you query a local secondary index and request only attributes
      #     that are projected into that index, the operation will read only the
      #     index and not the table. If any of the requested attributes are not
      #     projected into the local secondary index, DynamoDB will fetch each
      #     of these attributes from the parent table. This extra fetching
      #     incurs additional throughput cost and latency.
      #
      #     If you query a global secondary index, you can only request
      #     attributes that are projected into the index. Global secondary index
      #     queries cannot fetch attributes from the parent table.
      #
      #   If neither *Select* nor *AttributesToGet* are specified, DynamoDB
      #   defaults to `ALL_ATTRIBUTES` when accessing a table, and
      #   `ALL_PROJECTED_ATTRIBUTES` when accessing an index. You cannot use
      #   both *Select* and *AttributesToGet* together in a single request,
      #   unless the value for *Select* is `SPECIFIC_ATTRIBUTES`. (This usage is
      #   equivalent to specifying *AttributesToGet* without any value for
      #   *Select*.)
      #
      #   <note markdown="1"> If you use the *ProjectionExpression* parameter, then the value for
      #   *Select* can only be `SPECIFIC_ATTRIBUTES`. Any other value for
      #   *Select* will return an error.
      #
      #    </note>
      # @option options [Array<String>] :attributes_to_get
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *ProjectionExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #    This parameter allows you to retrieve attributes of type List or Map;
      #   however, it cannot retrieve individual elements within a List or a
      #   Map.
      #
      #   The names of one or more attributes to retrieve. If no attribute names
      #   are provided, then all attributes will be returned. If any of the
      #   requested attributes are not found, they will not appear in the
      #   result.
      #
      #   Note that *AttributesToGet* has no effect on provisioned throughput
      #   consumption. DynamoDB determines capacity units consumed based on item
      #   size, not on the amount of data that is returned to an application.
      #
      #   You cannot use both *AttributesToGet* and *Select* together in a
      #   *Query* request, *unless* the value for *Select* is
      #   `SPECIFIC_ATTRIBUTES`. (This usage is equivalent to specifying
      #   *AttributesToGet* without any value for *Select*.)
      #
      #   If you query a local secondary index and request only attributes that
      #   are projected into that index, the operation will read only the index
      #   and not the table. If any of the requested attributes are not
      #   projected into the local secondary index, DynamoDB will fetch each of
      #   these attributes from the parent table. This extra fetching incurs
      #   additional throughput cost and latency.
      #
      #   If you query a global secondary index, you can only request attributes
      #   that are projected into the index. Global secondary index queries
      #   cannot fetch attributes from the parent table.
      # @option options [Integer] :limit
      #   The maximum number of items to evaluate (not necessarily the number of
      #   matching items). If DynamoDB processes the number of items up to the
      #   limit while processing the results, it stops the operation and returns
      #   the matching values up to that point, and a key in *LastEvaluatedKey*
      #   to apply in a subsequent operation, so that you can pick up where you
      #   left off. Also, if the processed data set size exceeds 1 MB before
      #   DynamoDB reaches this limit, it stops the operation and returns the
      #   matching values up to the limit, and a key in *LastEvaluatedKey* to
      #   apply in a subsequent operation to continue the operation. For more
      #   information, see [Query and Scan][1] in the *Amazon DynamoDB Developer
      #   Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html
      # @option options [Boolean] :consistent_read
      #   Determines the read consistency model: If set to `true`, then the
      #   operation uses strongly consistent reads; otherwise, the operation
      #   uses eventually consistent reads.
      #
      #   Strongly consistent reads are not supported on global secondary
      #   indexes. If you query a global secondary index with *ConsistentRead*
      #   set to `true`, you will receive a *ValidationException*.
      # @option options [Hash<String,Types::Condition>] :key_conditions
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *KeyConditionExpression* instead. Do not
      #   combine legacy parameters and expression parameters in a single API
      #   call; otherwise, DynamoDB will return a *ValidationException*
      #   exception.
      #
      #   The selection criteria for the query. For a query on a table, you can
      #   have conditions only on the table primary key attributes. You must
      #   provide the partition key name and value as an `EQ` condition. You can
      #   optionally provide a second condition, referring to the sort key.
      #
      #   <note markdown="1"> If you don't provide a sort key condition, all of the items that
      #   match the partition key will be retrieved. If a *FilterExpression* or
      #   *QueryFilter* is present, it will be applied after the items are
      #   retrieved.
      #
      #    </note>
      #
      #   For a query on an index, you can have conditions only on the index key
      #   attributes. You must provide the index partition key name and value as
      #   an `EQ` condition. You can optionally provide a second condition,
      #   referring to the index sort key.
      #
      #   Each *KeyConditions* element consists of an attribute name to compare,
      #   along with the following:
      #
      #   * *AttributeValueList* - One or more values to evaluate against the
      #     supplied attribute. The number of values in the list depends on the
      #     *ComparisonOperator* being used.
      #
      #     For type Number, value comparisons are numeric.
      #
      #     String value comparisons for greater than, equals, or less than are
      #     based on ASCII character code values. For example, `a` is greater
      #     than `A`, and `a` is greater than `B`. For a list of code values,
      #     see
      #     [http://en.wikipedia.org/wiki/ASCII#ASCII\_printable\_characters][1].
      #
      #     For Binary, DynamoDB treats each byte of the binary data as unsigned
      #     when it compares binary values.
      #
      #   * *ComparisonOperator* - A comparator for evaluating attributes, for
      #     example, equals, greater than, less than, and so on.
      #
      #     For *KeyConditions*, only the following comparison operators are
      #     supported:
      #
      #     `EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN`
      #
      #     The following are descriptions of these comparison operators.
      #
      #     * `EQ`\: Equal.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String, Number, or Binary (not a set type). If an item contains an
      #       *AttributeValue* element of a different type than the one
      #       specified in the request, the value does not match. For example,
      #       `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also, `\{"N":"6"\}`
      #       does not equal `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `LE`\: Less than or equal.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `LT`\: Less than.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String, Number, or Binary (not a set type). If an item contains an
      #       *AttributeValue* element of a different type than the one provided
      #       in the request, the value does not match. For example,
      #       `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also, `\{"N":"6"\}`
      #       does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `GE`\: Greater than or equal.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `GT`\: Greater than.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `BEGINS_WITH`\: Checks for a prefix.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String or Binary (not a Number or a set type). The target
      #       attribute of the comparison must be of type String or Binary (not
      #       a Number or a set type).
      #
      #
      #
      #     * `BETWEEN`\: Greater than or equal to the first value, and less
      #       than or equal to the second value.
      #
      #       *AttributeValueList* must contain two *AttributeValue* elements of
      #       the same type, either String, Number, or Binary (not a set type).
      #       A target attribute matches if the target value is greater than, or
      #       equal to, the first element and less than, or equal to, the second
      #       element. If an item contains an *AttributeValue* element of a
      #       different type than the one provided in the request, the value
      #       does not match. For example, `\{"S":"6"\}` does not compare to
      #       `\{"N":"6"\}`. Also, `\{"N":"6"\}` does not compare to
      #       `\{"NS":["6", "2", "1"]\}`
      #
      #   For usage examples of *AttributeValueList* and *ComparisonOperator*,
      #   see [Legacy Conditional Parameters][2] in the *Amazon DynamoDB
      #   Developer Guide*.
      #
      #
      #
      #   [1]: http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html
      # @option options [Hash<String,Types::Condition>] :query_filter
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *FilterExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #   A condition that evaluates the query results after the items are read
      #   and returns only the desired values.
      #
      #   This parameter does not support attributes of type List or Map.
      #
      #   <note markdown="1"> A *QueryFilter* is applied after the items have already been read; the
      #   process of filtering does not consume any additional read capacity
      #   units.
      #
      #    </note>
      #
      #   If you provide more than one condition in the *QueryFilter* map, then
      #   by default all of the conditions must evaluate to true. In other
      #   words, the conditions are ANDed together. (You can use the
      #   *ConditionalOperator* parameter to OR the conditions instead. If you
      #   do this, then at least one of the conditions must evaluate to true,
      #   rather than all of them.)
      #
      #   Note that *QueryFilter* does not allow key attributes. You cannot
      #   define a filter condition on a partition key or a sort key.
      #
      #   Each *QueryFilter* element consists of an attribute name to compare,
      #   along with the following:
      #
      #   * *AttributeValueList* - One or more values to evaluate against the
      #     supplied attribute. The number of values in the list depends on the
      #     operator specified in *ComparisonOperator*.
      #
      #     For type Number, value comparisons are numeric.
      #
      #     String value comparisons for greater than, equals, or less than are
      #     based on ASCII character code values. For example, `a` is greater
      #     than `A`, and `a` is greater than `B`. For a list of code values,
      #     see
      #     [http://en.wikipedia.org/wiki/ASCII#ASCII\_printable\_characters][1].
      #
      #     For type Binary, DynamoDB treats each byte of the binary data as
      #     unsigned when it compares binary values.
      #
      #     For information on specifying data types in JSON, see [JSON Data
      #     Format][2] in the *Amazon DynamoDB Developer Guide*.
      #
      #   * *ComparisonOperator* - A comparator for evaluating attributes. For
      #     example, equals, greater than, less than, etc.
      #
      #     The following comparison operators are available:
      #
      #     `EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
      #     NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN`
      #
      #     For complete descriptions of all comparison operators, see the
      #     [Condition][3] data type.
      #
      #
      #
      #   [1]: http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html
      #   [3]: http://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_Condition.html
      # @option options [String] :conditional_operator
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *FilterExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #   A logical operator to apply to the conditions in a *QueryFilter* map:
      #
      #   * `AND` - If all of the conditions evaluate to true, then the entire
      #     map evaluates to true.
      #
      #   * `OR` - If at least one of the conditions evaluate to true, then the
      #     entire map evaluates to true.
      #
      #   If you omit *ConditionalOperator*, then `AND` is the default.
      #
      #   The operation will succeed only if the entire map evaluates to true.
      #
      #   <note markdown="1"> This parameter does not support attributes of type List or Map.
      #
      #    </note>
      # @option options [Boolean] :scan_index_forward
      #   Specifies the order for index traversal: If `true` (default), the
      #   traversal is performed in ascending order; if `false`, the traversal
      #   is performed in descending order.
      #
      #   Items with the same partition key value are stored in sorted order by
      #   sort key. If the sort key data type is Number, the results are stored
      #   in numeric order. For type String, the results are stored in order of
      #   ASCII character code values. For type Binary, DynamoDB treats each
      #   byte of the binary data as unsigned.
      #
      #   If *ScanIndexForward* is `true`, DynamoDB returns the results in the
      #   order in which they are stored (by sort key value). This is the
      #   default behavior. If *ScanIndexForward* is `false`, DynamoDB reads the
      #   results in reverse order by sort key value, and then returns the
      #   results to the client.
      # @option options [Hash<String,Types::AttributeValue>] :exclusive_start_key
      #   The primary key of the first item that this operation will evaluate.
      #   Use the value that was returned for *LastEvaluatedKey* in the previous
      #   operation.
      #
      #   The data type for *ExclusiveStartKey* must be String, Number or
      #   Binary. No set data types are allowed.
      # @option options [String] :return_consumed_capacity
      #   Determines the level of detail about provisioned throughput
      #   consumption that is returned in the response:
      #
      #   * *INDEXES* - The response includes the aggregate *ConsumedCapacity*
      #     for the operation, together with *ConsumedCapacity* for each table
      #     and secondary index that was accessed.
      #
      #     Note that some operations, such as *GetItem* and *BatchGetItem*, do
      #     not access any indexes at all. In these cases, specifying *INDEXES*
      #     will only return *ConsumedCapacity* information for table(s).
      #
      #   * *TOTAL* - The response includes only the aggregate
      #     *ConsumedCapacity* for the operation.
      #
      #   * *NONE* - No *ConsumedCapacity* details are included in the response.
      # @option options [String] :projection_expression
      #   A string that identifies one or more attributes to retrieve from the
      #   table. These attributes can include scalars, sets, or elements of a
      #   JSON document. The attributes in the expression must be separated by
      #   commas.
      #
      #   If no attribute names are specified, then all attributes will be
      #   returned. If any of the requested attributes are not found, they will
      #   not appear in the result.
      #
      #   For more information, see [Accessing Item Attributes][1] in the
      #   *Amazon DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *ProjectionExpression* replaces the legacy *AttributesToGet*
      #   parameter.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html
      # @option options [String] :filter_expression
      #   A string that contains conditions that DynamoDB applies after the
      #   *Query* operation, but before the data is returned to you. Items that
      #   do not satisfy the *FilterExpression* criteria are not returned.
      #
      #   <note markdown="1"> A *FilterExpression* is applied after the items have already been
      #   read; the process of filtering does not consume any additional read
      #   capacity units.
      #
      #    </note>
      #
      #   For more information, see [Filter Expressions][1] in the *Amazon
      #   DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *FilterExpression* replaces the legacy *QueryFilter* and
      #   *ConditionalOperator* parameters.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults
      # @option options [String] :key_condition_expression
      #   The condition that specifies the key value(s) for items to be
      #   retrieved by the *Query* action.
      #
      #   The condition must perform an equality test on a single partition key
      #   value. The condition can also perform one of several comparison tests
      #   on a single sort key value. *Query* can use *KeyConditionExpression*
      #   to retrieve one item with a given partition key value and sort key
      #   value, or several items that have the same partition key value but
      #   different sort key values.
      #
      #   The partition key equality test is required, and must be specified in
      #   the following format:
      #
      #   `partitionKeyName` *=* `:partitionkeyval`
      #
      #   If you also want to provide a condition for the sort key, it must be
      #   combined using *AND* with the condition for the sort key. Following is
      #   an example, using the **=** comparison operator for the sort key:
      #
      #   `partitionKeyName` *=* `:partitionkeyval` *AND* `sortKeyName` *=*
      #   `:sortkeyval`
      #
      #   Valid comparisons for the sort key condition are as follows:
      #
      #   * `sortKeyName` *=* `:sortkeyval` - true if the sort key value is
      #     equal to `:sortkeyval`.
      #
      #   * `sortKeyName` *&lt;* `:sortkeyval` - true if the sort key value is
      #     less than `:sortkeyval`.
      #
      #   * `sortKeyName` *&lt;=* `:sortkeyval` - true if the sort key value is
      #     less than or equal to `:sortkeyval`.
      #
      #   * `sortKeyName` *&gt;* `:sortkeyval` - true if the sort key value is
      #     greater than `:sortkeyval`.
      #
      #   * `sortKeyName` <i>&gt;= </i> `:sortkeyval` - true if the sort key
      #     value is greater than or equal to `:sortkeyval`.
      #
      #   * `sortKeyName` *BETWEEN* `:sortkeyval1` *AND* `:sortkeyval2` - true
      #     if the sort key value is greater than or equal to `:sortkeyval1`,
      #     and less than or equal to `:sortkeyval2`.
      #
      #   * *begins\_with (* `sortKeyName`, `:sortkeyval` *)* - true if the sort
      #     key value begins with a particular operand. (You cannot use this
      #     function with a sort key that is of type Number.) Note that the
      #     function name `begins_with` is case-sensitive.
      #
      #   Use the *ExpressionAttributeValues* parameter to replace tokens such
      #   as `:partitionval` and `:sortval` with actual values at runtime.
      #
      #   You can optionally use the *ExpressionAttributeNames* parameter to
      #   replace the names of the partition key and sort key with placeholder
      #   tokens. This option might be necessary if an attribute name conflicts
      #   with a DynamoDB reserved word. For example, the following
      #   *KeyConditionExpression* parameter causes an error because *Size* is a
      #   reserved word:
      #
      #   * `Size = :myval`
      #
      #   ^
      #
      #   To work around this, define a placeholder (such a `#S`) to represent
      #   the attribute name *Size*. *KeyConditionExpression* then is as
      #   follows:
      #
      #   * `#S = :myval`
      #
      #   ^
      #
      #   For a list of reserved words, see [Reserved Words][1] in the *Amazon
      #   DynamoDB Developer Guide*.
      #
      #   For more information on *ExpressionAttributeNames* and
      #   *ExpressionAttributeValues*, see [Using Placeholders for Attribute
      #   Names and Values][2] in the *Amazon DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *KeyConditionExpression* replaces the legacy *KeyConditions*
      #   parameter.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html
      # @option options [Hash<String,String>] :expression_attribute_names
      #   One or more substitution tokens for attribute names in an expression.
      #   The following are some use cases for using
      #   *ExpressionAttributeNames*\:
      #
      #   * To access an attribute whose name conflicts with a DynamoDB reserved
      #     word.
      #
      #   * To create a placeholder for repeating occurrences of an attribute
      #     name in an expression.
      #
      #   * To prevent special characters in an attribute name from being
      #     misinterpreted in an expression.
      #
      #   Use the **#** character in an expression to dereference an attribute
      #   name. For example, consider the following attribute name:
      #
      #   * `Percentile`
      #
      #   ^
      #
      #   The name of this attribute conflicts with a reserved word, so it
      #   cannot be used directly in an expression. (For the complete list of
      #   reserved words, see [Reserved Words][1] in the *Amazon DynamoDB
      #   Developer Guide*). To work around this, you could specify the
      #   following for *ExpressionAttributeNames*\:
      #
      #   * `\{"#P":"Percentile"\}`
      #
      #   ^
      #
      #   You could then use this substitution in an expression, as in this
      #   example:
      #
      #   * `#P = :val`
      #
      #   ^
      #
      #   <note markdown="1"> Tokens that begin with the **\:** character are *expression attribute
      #   values*, which are placeholders for the actual value at runtime.
      #
      #    </note>
      #
      #   For more information on expression attribute names, see [Accessing
      #   Item Attributes][2] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html
      # @option options [Hash<String,Types::AttributeValue>] :expression_attribute_values
      #   One or more values that can be substituted in an expression.
      #
      #   Use the **\:** (colon) character in an expression to dereference an
      #   attribute value. For example, suppose that you wanted to check whether
      #   the value of the *ProductStatus* attribute was one of the following:
      #
      #   `Available | Backordered | Discontinued`
      #
      #   You would first need to specify *ExpressionAttributeValues* as
      #   follows:
      #
      #   `\{ ":avail":\{"S":"Available"\}, ":back":\{"S":"Backordered"\},
      #   ":disc":\{"S":"Discontinued"\} \}`
      #
      #   You could then use these values in an expression, such as this:
      #
      #   `ProductStatus IN (:avail, :back, :disc)`
      #
      #   For more information on expression attribute values, see [Specifying
      #   Conditions][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html
      # @return [Types::QueryOutput]
      def query(options = {})
        options = options.merge(table_name: @name)
        resp = @client.query(options)
        resp.data
      end

      # @example Request syntax with placeholder values
      #
      #   table.scan({
      #     index_name: "IndexName",
      #     attributes_to_get: ["AttributeName"],
      #     limit: 1,
      #     select: "ALL_ATTRIBUTES", # accepts ALL_ATTRIBUTES, ALL_PROJECTED_ATTRIBUTES, SPECIFIC_ATTRIBUTES, COUNT
      #     scan_filter: {
      #       "AttributeName" => {
      #         attribute_value_list: ["value"], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #         comparison_operator: "EQ", # required, accepts EQ, NE, IN, LE, LT, GE, GT, BETWEEN, NOT_NULL, NULL, CONTAINS, NOT_CONTAINS, BEGINS_WITH
      #       },
      #     },
      #     conditional_operator: "AND", # accepts AND, OR
      #     exclusive_start_key: {
      #       "AttributeName" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #     return_consumed_capacity: "INDEXES", # accepts INDEXES, TOTAL, NONE
      #     total_segments: 1,
      #     segment: 1,
      #     projection_expression: "ProjectionExpression",
      #     filter_expression: "ConditionExpression",
      #     expression_attribute_names: {
      #       "ExpressionAttributeNameVariable" => "AttributeName",
      #     },
      #     expression_attribute_values: {
      #       "ExpressionAttributeValueVariable" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #     consistent_read: false,
      #   })
      # @param [Hash] options ({})
      # @option options [String] :index_name
      #   The name of a secondary index to scan. This index can be any local
      #   secondary index or global secondary index. Note that if you use the
      #   `IndexName` parameter, you must also provide `TableName`.
      # @option options [Array<String>] :attributes_to_get
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *ProjectionExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #    This parameter allows you to retrieve attributes of type List or Map;
      #   however, it cannot retrieve individual elements within a List or a
      #   Map.
      #
      #   The names of one or more attributes to retrieve. If no attribute names
      #   are provided, then all attributes will be returned. If any of the
      #   requested attributes are not found, they will not appear in the
      #   result.
      #
      #   Note that *AttributesToGet* has no effect on provisioned throughput
      #   consumption. DynamoDB determines capacity units consumed based on item
      #   size, not on the amount of data that is returned to an application.
      # @option options [Integer] :limit
      #   The maximum number of items to evaluate (not necessarily the number of
      #   matching items). If DynamoDB processes the number of items up to the
      #   limit while processing the results, it stops the operation and returns
      #   the matching values up to that point, and a key in *LastEvaluatedKey*
      #   to apply in a subsequent operation, so that you can pick up where you
      #   left off. Also, if the processed data set size exceeds 1 MB before
      #   DynamoDB reaches this limit, it stops the operation and returns the
      #   matching values up to the limit, and a key in *LastEvaluatedKey* to
      #   apply in a subsequent operation to continue the operation. For more
      #   information, see [Query and Scan][1] in the *Amazon DynamoDB Developer
      #   Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html
      # @option options [String] :select
      #   The attributes to be returned in the result. You can retrieve all item
      #   attributes, specific item attributes, or the count of matching items.
      #
      #   * `ALL_ATTRIBUTES` - Returns all of the item attributes.
      #
      #   * `ALL_PROJECTED_ATTRIBUTES` - Allowed only when querying an index.
      #     Retrieves all attributes that have been projected into the index. If
      #     the index is configured to project all attributes, this return value
      #     is equivalent to specifying `ALL_ATTRIBUTES`.
      #
      #   * `COUNT` - Returns the number of matching items, rather than the
      #     matching items themselves.
      #
      #   * `SPECIFIC_ATTRIBUTES` - Returns only the attributes listed in
      #     *AttributesToGet*. This return value is equivalent to specifying
      #     *AttributesToGet* without specifying any value for *Select*.
      #
      #   If neither *Select* nor *AttributesToGet* are specified, DynamoDB
      #   defaults to `ALL_ATTRIBUTES`. You cannot use both *AttributesToGet*
      #   and *Select* together in a single request, unless the value for
      #   *Select* is `SPECIFIC_ATTRIBUTES`. (This usage is equivalent to
      #   specifying *AttributesToGet* without any value for *Select*.)
      # @option options [Hash<String,Types::Condition>] :scan_filter
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *FilterExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #   A condition that evaluates the scan results and returns only the
      #   desired values.
      #
      #   <note markdown="1"> This parameter does not support attributes of type List or Map.
      #
      #    </note>
      #
      #   If you specify more than one condition in the *ScanFilter* map, then
      #   by default all of the conditions must evaluate to true. In other
      #   words, the conditions are ANDed together. (You can use the
      #   *ConditionalOperator* parameter to OR the conditions instead. If you
      #   do this, then at least one of the conditions must evaluate to true,
      #   rather than all of them.)
      #
      #   Each *ScanFilter* element consists of an attribute name to compare,
      #   along with the following:
      #
      #   * *AttributeValueList* - One or more values to evaluate against the
      #     supplied attribute. The number of values in the list depends on the
      #     operator specified in *ComparisonOperator* .
      #
      #     For type Number, value comparisons are numeric.
      #
      #     String value comparisons for greater than, equals, or less than are
      #     based on ASCII character code values. For example, `a` is greater
      #     than `A`, and `a` is greater than `B`. For a list of code values,
      #     see
      #     [http://en.wikipedia.org/wiki/ASCII#ASCII\_printable\_characters][1].
      #
      #     For Binary, DynamoDB treats each byte of the binary data as unsigned
      #     when it compares binary values.
      #
      #     For information on specifying data types in JSON, see [JSON Data
      #     Format][2] in the *Amazon DynamoDB Developer Guide*.
      #
      #   * *ComparisonOperator* - A comparator for evaluating attributes. For
      #     example, equals, greater than, less than, etc.
      #
      #     The following comparison operators are available:
      #
      #     `EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
      #     NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN`
      #
      #     For complete descriptions of all comparison operators, see
      #     [Condition][3].
      #
      #
      #
      #   [1]: http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html
      #   [3]: http://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_Condition.html
      # @option options [String] :conditional_operator
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *FilterExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #   A logical operator to apply to the conditions in a *ScanFilter* map:
      #
      #   * `AND` - If all of the conditions evaluate to true, then the entire
      #     map evaluates to true.
      #
      #   * `OR` - If at least one of the conditions evaluate to true, then the
      #     entire map evaluates to true.
      #
      #   If you omit *ConditionalOperator*, then `AND` is the default.
      #
      #   The operation will succeed only if the entire map evaluates to true.
      #
      #   <note markdown="1"> This parameter does not support attributes of type List or Map.
      #
      #    </note>
      # @option options [Hash<String,Types::AttributeValue>] :exclusive_start_key
      #   The primary key of the first item that this operation will evaluate.
      #   Use the value that was returned for *LastEvaluatedKey* in the previous
      #   operation.
      #
      #   The data type for *ExclusiveStartKey* must be String, Number or
      #   Binary. No set data types are allowed.
      #
      #   In a parallel scan, a *Scan* request that includes *ExclusiveStartKey*
      #   must specify the same segment whose previous *Scan* returned the
      #   corresponding value of *LastEvaluatedKey*.
      # @option options [String] :return_consumed_capacity
      #   Determines the level of detail about provisioned throughput
      #   consumption that is returned in the response:
      #
      #   * *INDEXES* - The response includes the aggregate *ConsumedCapacity*
      #     for the operation, together with *ConsumedCapacity* for each table
      #     and secondary index that was accessed.
      #
      #     Note that some operations, such as *GetItem* and *BatchGetItem*, do
      #     not access any indexes at all. In these cases, specifying *INDEXES*
      #     will only return *ConsumedCapacity* information for table(s).
      #
      #   * *TOTAL* - The response includes only the aggregate
      #     *ConsumedCapacity* for the operation.
      #
      #   * *NONE* - No *ConsumedCapacity* details are included in the response.
      # @option options [Integer] :total_segments
      #   For a parallel *Scan* request, *TotalSegments* represents the total
      #   number of segments into which the *Scan* operation will be divided.
      #   The value of *TotalSegments* corresponds to the number of application
      #   workers that will perform the parallel scan. For example, if you want
      #   to use four application threads to scan a table or an index, specify a
      #   *TotalSegments* value of 4.
      #
      #   The value for *TotalSegments* must be greater than or equal to 1, and
      #   less than or equal to 1000000. If you specify a *TotalSegments* value
      #   of 1, the *Scan* operation will be sequential rather than parallel.
      #
      #   If you specify *TotalSegments*, you must also specify *Segment*.
      # @option options [Integer] :segment
      #   For a parallel *Scan* request, *Segment* identifies an individual
      #   segment to be scanned by an application worker.
      #
      #   Segment IDs are zero-based, so the first segment is always 0. For
      #   example, if you want to use four application threads to scan a table
      #   or an index, then the first thread specifies a *Segment* value of 0,
      #   the second thread specifies 1, and so on.
      #
      #   The value of *LastEvaluatedKey* returned from a parallel *Scan*
      #   request must be used as *ExclusiveStartKey* with the same segment ID
      #   in a subsequent *Scan* operation.
      #
      #   The value for *Segment* must be greater than or equal to 0, and less
      #   than the value provided for *TotalSegments*.
      #
      #   If you provide *Segment*, you must also provide *TotalSegments*.
      # @option options [String] :projection_expression
      #   A string that identifies one or more attributes to retrieve from the
      #   specified table or index. These attributes can include scalars, sets,
      #   or elements of a JSON document. The attributes in the expression must
      #   be separated by commas.
      #
      #   If no attribute names are specified, then all attributes will be
      #   returned. If any of the requested attributes are not found, they will
      #   not appear in the result.
      #
      #   For more information, see [Accessing Item Attributes][1] in the
      #   *Amazon DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *ProjectionExpression* replaces the legacy *AttributesToGet*
      #   parameter.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html
      # @option options [String] :filter_expression
      #   A string that contains conditions that DynamoDB applies after the
      #   *Scan* operation, but before the data is returned to you. Items that
      #   do not satisfy the *FilterExpression* criteria are not returned.
      #
      #   <note markdown="1"> A *FilterExpression* is applied after the items have already been
      #   read; the process of filtering does not consume any additional read
      #   capacity units.
      #
      #    </note>
      #
      #   For more information, see [Filter Expressions][1] in the *Amazon
      #   DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *FilterExpression* replaces the legacy *ScanFilter* and
      #   *ConditionalOperator* parameters.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults
      # @option options [Hash<String,String>] :expression_attribute_names
      #   One or more substitution tokens for attribute names in an expression.
      #   The following are some use cases for using
      #   *ExpressionAttributeNames*\:
      #
      #   * To access an attribute whose name conflicts with a DynamoDB reserved
      #     word.
      #
      #   * To create a placeholder for repeating occurrences of an attribute
      #     name in an expression.
      #
      #   * To prevent special characters in an attribute name from being
      #     misinterpreted in an expression.
      #
      #   Use the **#** character in an expression to dereference an attribute
      #   name. For example, consider the following attribute name:
      #
      #   * `Percentile`
      #
      #   ^
      #
      #   The name of this attribute conflicts with a reserved word, so it
      #   cannot be used directly in an expression. (For the complete list of
      #   reserved words, see [Reserved Words][1] in the *Amazon DynamoDB
      #   Developer Guide*). To work around this, you could specify the
      #   following for *ExpressionAttributeNames*\:
      #
      #   * `\{"#P":"Percentile"\}`
      #
      #   ^
      #
      #   You could then use this substitution in an expression, as in this
      #   example:
      #
      #   * `#P = :val`
      #
      #   ^
      #
      #   <note markdown="1"> Tokens that begin with the **\:** character are *expression attribute
      #   values*, which are placeholders for the actual value at runtime.
      #
      #    </note>
      #
      #   For more information on expression attribute names, see [Accessing
      #   Item Attributes][2] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html
      # @option options [Hash<String,Types::AttributeValue>] :expression_attribute_values
      #   One or more values that can be substituted in an expression.
      #
      #   Use the **\:** (colon) character in an expression to dereference an
      #   attribute value. For example, suppose that you wanted to check whether
      #   the value of the *ProductStatus* attribute was one of the following:
      #
      #   `Available | Backordered | Discontinued`
      #
      #   You would first need to specify *ExpressionAttributeValues* as
      #   follows:
      #
      #   `\{ ":avail":\{"S":"Available"\}, ":back":\{"S":"Backordered"\},
      #   ":disc":\{"S":"Discontinued"\} \}`
      #
      #   You could then use these values in an expression, such as this:
      #
      #   `ProductStatus IN (:avail, :back, :disc)`
      #
      #   For more information on expression attribute values, see [Specifying
      #   Conditions][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html
      # @option options [Boolean] :consistent_read
      #   A Boolean value that determines the read consistency model during the
      #   scan:
      #
      #   * If *ConsistentRead* is `false`, then the data returned from *Scan*
      #     might not contain the results from other recently completed write
      #     operations (PutItem, UpdateItem or DeleteItem).
      #
      #   * If *ConsistentRead* is `true`, then all of the write operations that
      #     completed before the *Scan* began are guaranteed to be contained in
      #     the *Scan* response.
      #
      #   The default setting for *ConsistentRead* is `false`.
      #
      #   The *ConsistentRead* parameter is not supported on global secondary
      #   indexes. If you scan a global secondary index with *ConsistentRead*
      #   set to true, you will receive a *ValidationException*.
      # @return [Types::ScanOutput]
      def scan(options = {})
        options = options.merge(table_name: @name)
        resp = @client.scan(options)
        resp.data
      end

      # @example Request syntax with placeholder values
      #
      #   table = table.update({
      #     attribute_definitions: [
      #       {
      #         attribute_name: "KeySchemaAttributeName", # required
      #         attribute_type: "S", # required, accepts S, N, B
      #       },
      #     ],
      #     provisioned_throughput: {
      #       read_capacity_units: 1, # required
      #       write_capacity_units: 1, # required
      #     },
      #     global_secondary_index_updates: [
      #       {
      #         update: {
      #           index_name: "IndexName", # required
      #           provisioned_throughput: { # required
      #             read_capacity_units: 1, # required
      #             write_capacity_units: 1, # required
      #           },
      #         },
      #         create: {
      #           index_name: "IndexName", # required
      #           key_schema: [ # required
      #             {
      #               attribute_name: "KeySchemaAttributeName", # required
      #               key_type: "HASH", # required, accepts HASH, RANGE
      #             },
      #           ],
      #           projection: { # required
      #             projection_type: "ALL", # accepts ALL, KEYS_ONLY, INCLUDE
      #             non_key_attributes: ["NonKeyAttributeName"],
      #           },
      #           provisioned_throughput: { # required
      #             read_capacity_units: 1, # required
      #             write_capacity_units: 1, # required
      #           },
      #         },
      #         delete: {
      #           index_name: "IndexName", # required
      #         },
      #       },
      #     ],
      #     stream_specification: {
      #       stream_enabled: false,
      #       stream_view_type: "NEW_IMAGE", # accepts NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES, KEYS_ONLY
      #     },
      #   })
      # @param [Hash] options ({})
      # @option options [Array<Types::AttributeDefinition>] :attribute_definitions
      #   An array of attributes that describe the key schema for the table and
      #   indexes. If you are adding a new global secondary index to the table,
      #   *AttributeDefinitions* must include the key element(s) of the new
      #   index.
      # @option options [Types::ProvisionedThroughput] :provisioned_throughput
      #   Represents the provisioned throughput settings for a specified table
      #   or index. The settings can be modified using the *UpdateTable*
      #   operation.
      #
      #   For current minimum and maximum provisioned throughput values, see
      #   [Limits][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html
      # @option options [Array<Types::GlobalSecondaryIndexUpdate>] :global_secondary_index_updates
      #   An array of one or more global secondary indexes for the table. For
      #   each index in the array, you can request one action:
      #
      #   * *Create* - add a new global secondary index to the table.
      #
      #   * *Update* - modify the provisioned throughput settings of an existing
      #     global secondary index.
      #
      #   * *Delete* - remove a global secondary index from the table.
      #
      #   For more information, see [Managing Global Secondary Indexes][1] in
      #   the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html
      # @option options [Types::StreamSpecification] :stream_specification
      #   Represents the DynamoDB Streams configuration for the table.
      #
      #   <note markdown="1"> You will receive a *ResourceInUseException* if you attempt to enable a
      #   stream on a table that already has a stream, or if you attempt to
      #   disable a stream on a table which does not have a stream.
      #
      #    </note>
      # @return [Table]
      def update(options = {})
        options = options.merge(table_name: @name)
        resp = @client.update_table(options)
        Table.new(
          name: @name,
          data: resp.data.table_description,
          client: @client
        )
      end

      # @example Request syntax with placeholder values
      #
      #   table.update_item({
      #     key: { # required
      #       "AttributeName" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #     attribute_updates: {
      #       "AttributeName" => {
      #         value: "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #         action: "ADD", # accepts ADD, PUT, DELETE
      #       },
      #     },
      #     expected: {
      #       "AttributeName" => {
      #         value: "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #         exists: false,
      #         comparison_operator: "EQ", # accepts EQ, NE, IN, LE, LT, GE, GT, BETWEEN, NOT_NULL, NULL, CONTAINS, NOT_CONTAINS, BEGINS_WITH
      #         attribute_value_list: ["value"], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #       },
      #     },
      #     conditional_operator: "AND", # accepts AND, OR
      #     return_values: "NONE", # accepts NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW
      #     return_consumed_capacity: "INDEXES", # accepts INDEXES, TOTAL, NONE
      #     return_item_collection_metrics: "SIZE", # accepts SIZE, NONE
      #     update_expression: "UpdateExpression",
      #     condition_expression: "ConditionExpression",
      #     expression_attribute_names: {
      #       "ExpressionAttributeNameVariable" => "AttributeName",
      #     },
      #     expression_attribute_values: {
      #       "ExpressionAttributeValueVariable" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      #     },
      #   })
      # @param [Hash] options ({})
      # @option options [required, Hash<String,Types::AttributeValue>] :key
      #   The primary key of the item to be updated. Each element consists of an
      #   attribute name and a value for that attribute.
      #
      #   For the primary key, you must provide all of the attributes. For
      #   example, with a simple primary key, you only need to provide a value
      #   for the partition key. For a composite primary key, you must provide
      #   values for both the partition key and the sort key.
      # @option options [Hash<String,Types::AttributeValueUpdate>] :attribute_updates
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *UpdateExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #    This parameter can be used for modifying top-level attributes;
      #   however, it does not support individual list or map elements.
      #
      #   The names of attributes to be modified, the action to perform on each,
      #   and the new value for each. If you are updating an attribute that is
      #   an index key attribute for any indexes on that table, the attribute
      #   type must match the index key type defined in the
      #   *AttributesDefinition* of the table description. You can use
      #   *UpdateItem* to update any non-key attributes.
      #
      #   Attribute values cannot be null. String and Binary type attributes
      #   must have lengths greater than zero. Set type attributes must not be
      #   empty. Requests with empty values will be rejected with a
      #   *ValidationException* exception.
      #
      #   Each *AttributeUpdates* element consists of an attribute name to
      #   modify, along with the following:
      #
      #   * *Value* - The new value, if applicable, for this attribute.
      #
      #   * *Action* - A value that specifies how to perform the update. This
      #     action is only valid for an existing attribute whose data type is
      #     Number or is a set; do not use `ADD` for other data types.
      #
      #     If an item with the specified primary key is found in the table, the
      #     following values perform the following actions:
      #
      #     * `PUT` - Adds the specified attribute to the item. If the attribute
      #       already exists, it is replaced by the new value.
      #
      #     * `DELETE` - Removes the attribute and its value, if no value is
      #       specified for `DELETE`. The data type of the specified value must
      #       match the existing value's data type.
      #
      #       If a set of values is specified, then those values are subtracted
      #       from the old set. For example, if the attribute value was the set
      #       `[a,b,c]` and the `DELETE` action specifies `[a,c]`, then the
      #       final attribute value is `[b]`. Specifying an empty set is an
      #       error.
      #
      #     * `ADD` - Adds the specified value to the item, if the attribute
      #       does not already exist. If the attribute does exist, then the
      #       behavior of `ADD` depends on the data type of the attribute:
      #
      #       * If the existing attribute is a number, and if *Value* is also a
      #         number, then *Value* is mathematically added to the existing
      #         attribute. If *Value* is a negative number, then it is
      #         subtracted from the existing attribute.
      #
      #         <note markdown="1"> If you use `ADD` to increment or decrement a number value for an
      #         item that doesn't exist before the update, DynamoDB uses 0 as
      #         the initial value.
      #
      #          Similarly, if you use `ADD` for an existing item to increment or
      #         decrement an attribute value that doesn't exist before the
      #         update, DynamoDB uses `0` as the initial value. For example,
      #         suppose that the item you want to update doesn't have an
      #         attribute named *itemcount*, but you decide to `ADD` the number
      #         `3` to this attribute anyway. DynamoDB will create the
      #         *itemcount* attribute, set its initial value to `0`, and finally
      #         add `3` to it. The result will be a new *itemcount* attribute,
      #         with a value of `3`.
      #
      #          </note>
      #
      #       * If the existing data type is a set, and if *Value* is also a
      #         set, then *Value* is appended to the existing set. For example,
      #         if the attribute value is the set `[1,2]`, and the `ADD` action
      #         specified `[3]`, then the final attribute value is `[1,2,3]`. An
      #         error occurs if an `ADD` action is specified for a set attribute
      #         and the attribute type specified does not match the existing set
      #         type.
      #
      #         Both sets must have the same primitive data type. For example,
      #         if the existing data type is a set of strings, *Value* must also
      #         be a set of strings.
      #
      #     If no item with the specified key is found in the table, the
      #     following values perform the following actions:
      #
      #     * `PUT` - Causes DynamoDB to create a new item with the specified
      #       primary key, and then adds the attribute.
      #
      #     * `DELETE` - Nothing happens, because attributes cannot be deleted
      #       from a nonexistent item. The operation succeeds, but DynamoDB does
      #       not create a new item.
      #
      #     * `ADD` - Causes DynamoDB to create an item with the supplied
      #       primary key and number (or set of numbers) for the attribute
      #       value. The only data types allowed are Number and Number Set.
      #
      #   If you provide any attributes that are part of an index key, then the
      #   data types for those attributes must match those of the schema in the
      #   table's attribute definition.
      # @option options [Hash<String,Types::ExpectedAttributeValue>] :expected
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use <i> ConditionExpression </i> instead. Do not
      #   combine legacy parameters and expression parameters in a single API
      #   call; otherwise, DynamoDB will return a *ValidationException*
      #   exception.
      #
      #   A map of attribute/condition pairs. *Expected* provides a conditional
      #   block for the *UpdateItem* operation.
      #
      #   Each element of *Expected* consists of an attribute name, a comparison
      #   operator, and one or more values. DynamoDB compares the attribute with
      #   the value(s) you supplied, using the comparison operator. For each
      #   *Expected* element, the result of the evaluation is either true or
      #   false.
      #
      #   If you specify more than one element in the *Expected* map, then by
      #   default all of the conditions must evaluate to true. In other words,
      #   the conditions are ANDed together. (You can use the
      #   *ConditionalOperator* parameter to OR the conditions instead. If you
      #   do this, then at least one of the conditions must evaluate to true,
      #   rather than all of them.)
      #
      #   If the *Expected* map evaluates to true, then the conditional
      #   operation succeeds; otherwise, it fails.
      #
      #   *Expected* contains the following:
      #
      #   * *AttributeValueList* - One or more values to evaluate against the
      #     supplied attribute. The number of values in the list depends on the
      #     *ComparisonOperator* being used.
      #
      #     For type Number, value comparisons are numeric.
      #
      #     String value comparisons for greater than, equals, or less than are
      #     based on ASCII character code values. For example, `a` is greater
      #     than `A`, and `a` is greater than `B`. For a list of code values,
      #     see
      #     [http://en.wikipedia.org/wiki/ASCII#ASCII\_printable\_characters][1].
      #
      #     For type Binary, DynamoDB treats each byte of the binary data as
      #     unsigned when it compares binary values.
      #
      #   * *ComparisonOperator* - A comparator for evaluating attributes in the
      #     *AttributeValueList*. When performing the comparison, DynamoDB uses
      #     strongly consistent reads.
      #
      #     The following comparison operators are available:
      #
      #     `EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
      #     NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN`
      #
      #     The following are descriptions of each comparison operator.
      #
      #     * `EQ`\: Equal. `EQ` is supported for all datatypes, including lists
      #       and maps.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, Binary, String Set, Number Set, or Binary
      #       Set. If an item contains an *AttributeValue* element of a
      #       different type than the one provided in the request, the value
      #       does not match. For example, `\{"S":"6"\}` does not equal
      #       `\{"N":"6"\}`. Also, `\{"N":"6"\}` does not equal `\{"NS":["6",
      #       "2", "1"]\}`.
      #
      #
      #
      #     * `NE`\: Not equal. `NE` is supported for all datatypes, including
      #       lists and maps.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String, Number, Binary, String Set, Number Set, or Binary Set. If
      #       an item contains an *AttributeValue* of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not equal `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `LE`\: Less than or equal.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `LT`\: Less than.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String, Number, or Binary (not a set type). If an item contains an
      #       *AttributeValue* element of a different type than the one provided
      #       in the request, the value does not match. For example,
      #       `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also, `\{"N":"6"\}`
      #       does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `GE`\: Greater than or equal.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `GT`\: Greater than.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If an item
      #       contains an *AttributeValue* element of a different type than the
      #       one provided in the request, the value does not match. For
      #       example, `\{"S":"6"\}` does not equal `\{"N":"6"\}`. Also,
      #       `\{"N":"6"\}` does not compare to `\{"NS":["6", "2", "1"]\}`.
      #
      #
      #
      #     * `NOT_NULL`\: The attribute exists. `NOT_NULL` is supported for all
      #       datatypes, including lists and maps.
      #
      #       <note markdown="1"> This operator tests for the existence of an attribute, not its
      #       data type. If the data type of attribute "`a`" is null, and you
      #       evaluate it using `NOT_NULL`, the result is a Boolean *true*. This
      #       result is because the attribute "`a`" exists; its data type is
      #       not relevant to the `NOT_NULL` comparison operator.
      #
      #        </note>
      #
      #     * `NULL`\: The attribute does not exist. `NULL` is supported for all
      #       datatypes, including lists and maps.
      #
      #       <note markdown="1"> This operator tests for the nonexistence of an attribute, not its
      #       data type. If the data type of attribute "`a`" is null, and you
      #       evaluate it using `NULL`, the result is a Boolean *false*. This is
      #       because the attribute "`a`" exists; its data type is not
      #       relevant to the `NULL` comparison operator.
      #
      #        </note>
      #
      #     * `CONTAINS`\: Checks for a subsequence, or value in a set.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If the target
      #       attribute of the comparison is of type String, then the operator
      #       checks for a substring match. If the target attribute of the
      #       comparison is of type Binary, then the operator looks for a
      #       subsequence of the target that matches the input. If the target
      #       attribute of the comparison is a set ("`SS`", "`NS`", or
      #       "`BS`"), then the operator evaluates to true if it finds an
      #       exact match with any member of the set.
      #
      #       CONTAINS is supported for lists: When evaluating "`a CONTAINS
      #       b`", "`a`" can be a list; however, "`b`" cannot be a set, a
      #       map, or a list.
      #
      #     * `NOT_CONTAINS`\: Checks for absence of a subsequence, or absence
      #       of a value in a set.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* element
      #       of type String, Number, or Binary (not a set type). If the target
      #       attribute of the comparison is a String, then the operator checks
      #       for the absence of a substring match. If the target attribute of
      #       the comparison is Binary, then the operator checks for the absence
      #       of a subsequence of the target that matches the input. If the
      #       target attribute of the comparison is a set ("`SS`", "`NS`",
      #       or "`BS`"), then the operator evaluates to true if it *does not*
      #       find an exact match with any member of the set.
      #
      #       NOT\_CONTAINS is supported for lists: When evaluating "`a NOT
      #       CONTAINS b`", "`a`" can be a list; however, "`b`" cannot be a
      #       set, a map, or a list.
      #
      #     * `BEGINS_WITH`\: Checks for a prefix.
      #
      #       *AttributeValueList* can contain only one *AttributeValue* of type
      #       String or Binary (not a Number or a set type). The target
      #       attribute of the comparison must be of type String or Binary (not
      #       a Number or a set type).
      #
      #
      #
      #     * `IN`\: Checks for matching elements within two sets.
      #
      #       *AttributeValueList* can contain one or more *AttributeValue*
      #       elements of type String, Number, or Binary (not a set type). These
      #       attributes are compared against an existing set type attribute of
      #       an item. If any elements of the input set are present in the item
      #       attribute, the expression evaluates to true.
      #
      #     * `BETWEEN`\: Greater than or equal to the first value, and less
      #       than or equal to the second value.
      #
      #       *AttributeValueList* must contain two *AttributeValue* elements of
      #       the same type, either String, Number, or Binary (not a set type).
      #       A target attribute matches if the target value is greater than, or
      #       equal to, the first element and less than, or equal to, the second
      #       element. If an item contains an *AttributeValue* element of a
      #       different type than the one provided in the request, the value
      #       does not match. For example, `\{"S":"6"\}` does not compare to
      #       `\{"N":"6"\}`. Also, `\{"N":"6"\}` does not compare to
      #       `\{"NS":["6", "2", "1"]\}`
      #
      #   For usage examples of *AttributeValueList* and *ComparisonOperator*,
      #   see [Legacy Conditional Parameters][2] in the *Amazon DynamoDB
      #   Developer Guide*.
      #
      #   For backward compatibility with previous DynamoDB releases, the
      #   following parameters can be used instead of *AttributeValueList* and
      #   *ComparisonOperator*\:
      #
      #   * *Value* - A value for DynamoDB to compare with an attribute.
      #
      #   * *Exists* - A Boolean value that causes DynamoDB to evaluate the
      #     value before attempting the conditional operation:
      #
      #     * If *Exists* is `true`, DynamoDB will check to see if that
      #       attribute value already exists in the table. If it is found, then
      #       the condition evaluates to true; otherwise the condition evaluate
      #       to false.
      #
      #     * If *Exists* is `false`, DynamoDB assumes that the attribute value
      #       does *not* exist in the table. If in fact the value does not
      #       exist, then the assumption is valid and the condition evaluates to
      #       true. If the value is found, despite the assumption that it does
      #       not exist, the condition evaluates to false.
      #
      #     Note that the default value for *Exists* is `true`.
      #
      #   The *Value* and *Exists* parameters are incompatible with
      #   *AttributeValueList* and *ComparisonOperator*. Note that if you use
      #   both sets of parameters at once, DynamoDB will return a
      #   *ValidationException* exception.
      #
      #   <note markdown="1"> This parameter does not support attributes of type List or Map.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html
      # @option options [String] :conditional_operator
      #   This is a legacy parameter, for backward compatibility. New
      #   applications should use *ConditionExpression* instead. Do not combine
      #   legacy parameters and expression parameters in a single API call;
      #   otherwise, DynamoDB will return a *ValidationException* exception.
      #
      #   A logical operator to apply to the conditions in the *Expected* map:
      #
      #   * `AND` - If all of the conditions evaluate to true, then the entire
      #     map evaluates to true.
      #
      #   * `OR` - If at least one of the conditions evaluate to true, then the
      #     entire map evaluates to true.
      #
      #   If you omit *ConditionalOperator*, then `AND` is the default.
      #
      #   The operation will succeed only if the entire map evaluates to true.
      #
      #   <note markdown="1"> This parameter does not support attributes of type List or Map.
      #
      #    </note>
      # @option options [String] :return_values
      #   Use *ReturnValues* if you want to get the item attributes as they
      #   appeared either before or after they were updated. For *UpdateItem*,
      #   the valid values are:
      #
      #   * `NONE` - If *ReturnValues* is not specified, or if its value is
      #     `NONE`, then nothing is returned. (This setting is the default for
      #     *ReturnValues*.)
      #
      #   * `ALL_OLD` - If *UpdateItem* overwrote an attribute name-value pair,
      #     then the content of the old item is returned.
      #
      #   * `UPDATED_OLD` - The old versions of only the updated attributes are
      #     returned.
      #
      #   * `ALL_NEW` - All of the attributes of the new version of the item are
      #     returned.
      #
      #   * `UPDATED_NEW` - The new versions of only the updated attributes are
      #     returned.
      #
      #   There is no additional cost associated with requesting a return value
      #   aside from the small network and processing overhead of receiving a
      #   larger response. No Read Capacity Units are consumed.
      #
      #   Values returned are strongly consistent
      # @option options [String] :return_consumed_capacity
      #   Determines the level of detail about provisioned throughput
      #   consumption that is returned in the response:
      #
      #   * *INDEXES* - The response includes the aggregate *ConsumedCapacity*
      #     for the operation, together with *ConsumedCapacity* for each table
      #     and secondary index that was accessed.
      #
      #     Note that some operations, such as *GetItem* and *BatchGetItem*, do
      #     not access any indexes at all. In these cases, specifying *INDEXES*
      #     will only return *ConsumedCapacity* information for table(s).
      #
      #   * *TOTAL* - The response includes only the aggregate
      #     *ConsumedCapacity* for the operation.
      #
      #   * *NONE* - No *ConsumedCapacity* details are included in the response.
      # @option options [String] :return_item_collection_metrics
      #   Determines whether item collection metrics are returned. If set to
      #   `SIZE`, the response includes statistics about item collections, if
      #   any, that were modified during the operation are returned in the
      #   response. If set to `NONE` (the default), no statistics are returned.
      # @option options [String] :update_expression
      #   An expression that defines one or more attributes to be updated, the
      #   action to be performed on them, and new value(s) for them.
      #
      #   The following action values are available for *UpdateExpression*.
      #
      #   * `SET` - Adds one or more attributes and values to an item. If any of
      #     these attribute already exist, they are replaced by the new values.
      #     You can also use `SET` to add or subtract from an attribute that is
      #     of type Number. For example: `SET myNum = myNum + :val`
      #
      #     `SET` supports the following functions:
      #
      #     * `if_not_exists (path, operand)` - if the item does not contain an
      #       attribute at the specified path, then `if_not_exists` evaluates to
      #       operand; otherwise, it evaluates to path. You can use this
      #       function to avoid overwriting an attribute that may already be
      #       present in the item.
      #
      #     * `list_append (operand, operand)` - evaluates to a list with a new
      #       element added to it. You can append the new element to the start
      #       or the end of the list by reversing the order of the operands.
      #
      #     These function names are case-sensitive.
      #
      #   * `REMOVE` - Removes one or more attributes from an item.
      #
      #   * `ADD` - Adds the specified value to the item, if the attribute does
      #     not already exist. If the attribute does exist, then the behavior of
      #     `ADD` depends on the data type of the attribute:
      #
      #     * If the existing attribute is a number, and if *Value* is also a
      #       number, then *Value* is mathematically added to the existing
      #       attribute. If *Value* is a negative number, then it is subtracted
      #       from the existing attribute.
      #
      #       <note markdown="1"> If you use `ADD` to increment or decrement a number value for an
      #       item that doesn't exist before the update, DynamoDB uses `0` as
      #       the initial value.
      #
      #        Similarly, if you use `ADD` for an existing item to increment or
      #       decrement an attribute value that doesn't exist before the
      #       update, DynamoDB uses `0` as the initial value. For example,
      #       suppose that the item you want to update doesn't have an
      #       attribute named *itemcount*, but you decide to `ADD` the number
      #       `3` to this attribute anyway. DynamoDB will create the *itemcount*
      #       attribute, set its initial value to `0`, and finally add `3` to
      #       it. The result will be a new *itemcount* attribute in the item,
      #       with a value of `3`.
      #
      #        </note>
      #
      #     * If the existing data type is a set and if *Value* is also a set,
      #       then *Value* is added to the existing set. For example, if the
      #       attribute value is the set `[1,2]`, and the `ADD` action specified
      #       `[3]`, then the final attribute value is `[1,2,3]`. An error
      #       occurs if an `ADD` action is specified for a set attribute and the
      #       attribute type specified does not match the existing set type.
      #
      #       Both sets must have the same primitive data type. For example, if
      #       the existing data type is a set of strings, the *Value* must also
      #       be a set of strings.
      #
      #     The `ADD` action only supports Number and set data types. In
      #     addition, `ADD` can only be used on top-level attributes, not nested
      #     attributes.
      #
      #   * `DELETE` - Deletes an element from a set.
      #
      #     If a set of values is specified, then those values are subtracted
      #     from the old set. For example, if the attribute value was the set
      #     `[a,b,c]` and the `DELETE` action specifies `[a,c]`, then the final
      #     attribute value is `[b]`. Specifying an empty set is an error.
      #
      #     The `DELETE` action only supports set data types. In addition,
      #     `DELETE` can only be used on top-level attributes, not nested
      #     attributes.
      #
      #   You can have many actions in a single expression, such as the
      #   following: `SET a=:value1, b=:value2 DELETE :value3, :value4, :value5`
      #
      #   For more information on update expressions, see [Modifying Items and
      #   Attributes][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *UpdateExpression* replaces the legacy *AttributeUpdates* parameter.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.Modifying.html
      # @option options [String] :condition_expression
      #   A condition that must be satisfied in order for a conditional update
      #   to succeed.
      #
      #   An expression can contain any of the following:
      #
      #   * Functions: `attribute_exists | attribute_not_exists | attribute_type
      #     | contains | begins_with | size`
      #
      #     These function names are case-sensitive.
      #
      #   * Comparison operators: ` = | &#x3C;&#x3E; | &#x3C; | &#x3E; | &#x3C;=
      #     | &#x3E;= | BETWEEN | IN`
      #
      #   * Logical operators: `AND | OR | NOT`
      #
      #   For more information on condition expressions, see [Specifying
      #   Conditions][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #   <note markdown="1"> *ConditionExpression* replaces the legacy *ConditionalOperator* and
      #   *Expected* parameters.
      #
      #    </note>
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html
      # @option options [Hash<String,String>] :expression_attribute_names
      #   One or more substitution tokens for attribute names in an expression.
      #   The following are some use cases for using
      #   *ExpressionAttributeNames*\:
      #
      #   * To access an attribute whose name conflicts with a DynamoDB reserved
      #     word.
      #
      #   * To create a placeholder for repeating occurrences of an attribute
      #     name in an expression.
      #
      #   * To prevent special characters in an attribute name from being
      #     misinterpreted in an expression.
      #
      #   Use the **#** character in an expression to dereference an attribute
      #   name. For example, consider the following attribute name:
      #
      #   * `Percentile`
      #
      #   ^
      #
      #   The name of this attribute conflicts with a reserved word, so it
      #   cannot be used directly in an expression. (For the complete list of
      #   reserved words, see [Reserved Words][1] in the *Amazon DynamoDB
      #   Developer Guide*). To work around this, you could specify the
      #   following for *ExpressionAttributeNames*\:
      #
      #   * `\{"#P":"Percentile"\}`
      #
      #   ^
      #
      #   You could then use this substitution in an expression, as in this
      #   example:
      #
      #   * `#P = :val`
      #
      #   ^
      #
      #   <note markdown="1"> Tokens that begin with the **\:** character are *expression attribute
      #   values*, which are placeholders for the actual value at runtime.
      #
      #    </note>
      #
      #   For more information on expression attribute names, see [Accessing
      #   Item Attributes][2] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html
      #   [2]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html
      # @option options [Hash<String,Types::AttributeValue>] :expression_attribute_values
      #   One or more values that can be substituted in an expression.
      #
      #   Use the **\:** (colon) character in an expression to dereference an
      #   attribute value. For example, suppose that you wanted to check whether
      #   the value of the *ProductStatus* attribute was one of the following:
      #
      #   `Available | Backordered | Discontinued`
      #
      #   You would first need to specify *ExpressionAttributeValues* as
      #   follows:
      #
      #   `\{ ":avail":\{"S":"Available"\}, ":back":\{"S":"Backordered"\},
      #   ":disc":\{"S":"Discontinued"\} \}`
      #
      #   You could then use these values in an expression, such as this:
      #
      #   `ProductStatus IN (:avail, :back, :disc)`
      #
      #   For more information on expression attribute values, see [Specifying
      #   Conditions][1] in the *Amazon DynamoDB Developer Guide*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html
      # @return [Types::UpdateItemOutput]
      def update_item(options = {})
        options = options.merge(table_name: @name)
        resp = @client.update_item(options)
        resp.data
      end

      # @deprecated
      # @api private
      def identifiers
        { name: @name }
      end
      deprecated(:identifiers)

      private

      def extract_name(args, options)
        value = args[0] || options.delete(:name)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :name"
        else
          msg = "expected :name to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection < Aws::Resources::Collection; end
    end
  end
end
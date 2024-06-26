
/**
 * This file is part of the Phalcon Framework.
 *
 * (c) Phalcon Team <team@phalcon.io>
 *
 * For the full copyright and license information, please view the LICENSE.txt
 * file that was distributed with this source code.
 */

namespace Phalcon\Db;

/**
 * Allows to define reference constraints on tables
 *
 *```php
 * $reference = new \Phalcon\Db\Reference(
 *     "field_fk",
 *     [
 *         "referencedSchema"  => "invoicing",
 *         "referencedTable"   => "products",
 *         "columns"           => [
 *             "producttype",
 *             "product_code",
 *         ],
 *         "referencedColumns" => [
 *             "type",
 *             "code",
 *         ],
 *     ]
 * );
 *```
 */
class Reference implements ReferenceInterface
{
    /**
     * Local reference columns
     *
     * @var array
     */
    protected columns;

    /**
     * Constraint name
     *
     * @var string
     */
    protected name;

    /**
     * Referenced Columns
     *
     * @var array
     */
    protected referencedColumns;

    /**
     * Referenced Schema
     *
     * @var string
     */
    protected referencedSchema;

    /**
     * Referenced Table
     *
     * @var string
     */
    protected referencedTable;

    /**
     * Schema name
     *
     * @var string
     */
    protected schemaName;

    /**
     * ON DELETE
     *
     * @var string
     */
    protected onDelete;

    /**
     * ON UPDATE
     *
     * @var string
     */
    protected onUpdate;

    /**
     * Phalcon\Db\Reference constructor
     */
    public function __construct(string! name, array! definition)
    {
        var columns, schema, referencedTable, referencedSchema,
            referencedColumns, onDelete, onUpdate;

        let this->name = name;

        if unlikely !fetch referencedTable, definition["referencedTable"] {
            throw new Exception("Referenced table is required");
        }

        let this->referencedTable = referencedTable;

        if unlikely !fetch columns, definition["columns"] {
            throw new Exception("Foreign key columns are required");
        }

        let this->columns = columns;

        if unlikely !fetch referencedColumns, definition["referencedColumns"] {
            throw new Exception(
                "Referenced columns of the foreign key are required"
            );
        }

        let this->referencedColumns = referencedColumns;

        if fetch schema, definition["schema"] {
            let this->schemaName = schema;
        }

        if fetch referencedSchema, definition["referencedSchema"] {
            let this->referencedSchema = referencedSchema;
        }

        if fetch onDelete, definition["onDelete"] {
            let this->onDelete = onDelete;
        }

        if fetch onUpdate, definition["onUpdate"] {
            let this->onUpdate = onUpdate;
        }

        if unlikely count(columns) != count(referencedColumns) {
            throw new Exception(
                "Number of columns is not equals than the number of columns referenced"
            );
        }
    }

    /**
     * Local reference columns
     */
    public function getColumns() -> array
    {
        return this->columns;
    }

    /**
     * Constraint name
     */
    public function getName() -> string
    {
        return this->name;
    }

    /**
     * Referenced Columns
     */
    public function getReferencedColumns() -> array
    {
        return this->referencedColumns;
    }

    /**
     * Referenced Schema
     */
    public function getReferencedSchema() -> string
    {
        return this->referencedSchema;
    }

    /**
     * Referenced Table
     */
    public function getReferencedTable() -> string
    {
        return this->referencedTable;
    }

    /**
     * Schema name
     */
    public function getSchemaName() -> string
    {
        return this->schemaName;
    }

    /**
     * ON DELETE
     */
    public function getOnDelete() -> string
    {
        return this->onDelete;
    }

    /**
     * ON UPDATE
     */
    public function getOnUpdate() -> string
    {
        return this->onUpdate;
    }
}

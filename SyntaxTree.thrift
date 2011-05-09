
namespace java tw.maple.generated
namespace cpp tw.maple.generated

typedef list<string> StringList

enum ExpressionType
{
    IDENTIFIER,
    CALL
}

enum IdentifierType
{
    TYPE_IDENTIFIER,
    ATTR_IDENTIFIER,
    IDENTIFIER, 
}
enum ObjectType
{
    TYPE_CLASS,
    TYPE_INTERFACE,
}

struct Identifier
{
    1: IdentifierType type,
    2: string name,
    3: string qualifier,
}

struct Literal
{
    2: string value,
}

struct CallExpression
{
    1: bool is_new = 0,
    2: string mode,
}

struct ClassDefinition
{
    1:  string name,
    2: bool has_attr,
    3: bool has_baseclass,
    4: bool has_interface,
    5: bool has_stmt,
    6: StringList       inherits,
    7: StringList       interfaces,
    8: ObjectType  object_type;
    9: string   attribute,
}

struct BinaryExpression 
{
    1: string op = "";
}
struct UnaryExpression 
{
    1: string op = "";
}

service AstDumper
{
    oneway void startProgram( ),
    oneway void endProgram( ),

    oneway void startPackage( 1: StringList id ),
    oneway void endPackage( 1: StringList IDs ),

    oneway void startFunctionDefinition( 1: bool isAbstract),
        oneway void functionAttribute( 1: StringList attrs ),

        oneway void functionName( 1: string name ),

        oneway void startFunctionCommon( ),
        oneway void startFunctionSignature(  1: string type ),
            oneway void startFunctionSignatureParameters( ),
                oneway void startFunctionSignatureParameterMember( 1: string name, 2: StringList type ),
                oneway void endFunctionSignatureParameterMember( ),
            oneway void endFunctionSignatureParameters( ),
//            oneway void functionSignatureReturnType( 1: string name ),
        oneway void endFunctionSignature( ),

        oneway void endFunctionCommon( ),
    oneway void endFunctionDefinition( ),

    oneway void startReturnStatement( ),
    oneway void endReturnStatement( ),

    oneway void startIfStatement( ),
        oneway void startIfStatement_Condition( ),
        oneway void endIfStatement_Condition( ),

        oneway void startIfStatement_Then( ),
        oneway void endIfStatement_Then( ),

        oneway void startIfStatement_Else( ),
        oneway void endtIfStatement_Else( ),
    oneway void endIfStatement( ),

    oneway void startStmtExpression( ),
    oneway void endStmtExpression( ),

    oneway void startExpressionList( ),
        oneway void startCallExpression( 1: CallExpression call ),
            oneway void startArgumentList(),
                oneway void startOneArgument(),
                oneway void endOneArgument(),
            oneway void endArgumentList(),
        oneway void endCallExpression(),

        oneway void startBinaryExpression( 1: BinaryExpression op ),
        oneway void endBinaryExpression( ),

        oneway void startInstanceOfExpression( ),
        oneway void endInstanceOfExpression( ),

        oneway void startIsOperator( ),
        oneway void endIsOperator( ),

        oneway void startUnaryExpression( 1: UnaryExpression op ),
        oneway void endUnaryExpression( ),

        oneway void startVariableDeclare(  1: string name, 2: StringList type, 3: string attributes  ),
        oneway void endVariableDeclare( ),

        oneway void startAssignment(),
        oneway void endAssignment(),

        oneway void identifierExpression( 1: Identifier id ),
        oneway void literalStringExpression( 1: Literal str ),
        oneway void literalNumberExpression( 1: Literal str ),
        oneway void literalBooleanExpression( 1: Literal str ),
    oneway void endExpressionList( ),

    oneway void addImport( 1: StringList packages ),   // Do we need this? using namespace? or what ever suck?

    oneway void startStmtList(),
    oneway void endStmtList(),

    oneway void startClassDefinition( 1: ClassDefinition class_define ),

        oneway void startClassStmt(),
        oneway void endClassStmt(),
    oneway void endClassDefinition(),

    oneway void startAttributeList(),
    oneway void endAttributelist(),

    oneway void startMemberExpression( 1:StringList bases ),
    oneway void endMemberExpression(),
}

